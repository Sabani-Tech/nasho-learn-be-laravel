<?php

namespace App\Repositories\v1\user\auth;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class EloquentUserAuthRepositories implements UserAuthRepositories
{
    public function login($login, $user, $response)
    {
        if ($this->handle_exists_user_by_username($login, $user)) {
            $user_req = $this->handle_where_exists_by_username_or_email('username', $user, $login['umail']);
        } else if ($this->handle_exists_user_by_email($login, $user)) {
            $user_req = $this->handle_where_exists_by_username_or_email('email', $user, $login['umail']);
        } else {
            return $response->error_response('Wrong Email');
        }

        if ($this->handle_exists_user_by_password($login, $user_req)) {
            if (!$this->handle_validate_role_after_do_login($user_req)) {
                return $response->error_response('You not user');
            }

            if ($this->handle_validate_role_after_do_login($user_req)) {
                return $response->success_response($this->handle_mapping_user_login($user_req), 'Success Login');
            }
        } else {
            return $response->error_response('Wrong Password');
        }
    }

    private function handle_validate_role_after_do_login($user_req): bool
    {
        if ($user_req->role_id != 1) {
            return false;
        }

        return true;
    }

    private function handle_where_exists_by_username_or_email($type, $user, $req)
    {
        return $user->where($type, $req)->first();
    }

    private function handle_mapping_user_login($user_req): array
    {
        $token_create = $user_req->createToken('nasholearn');
        return array(
            'name' => $user_req->nama_lengkap,
            'username' => $user_req->username,
            'email' => $user_req->email,
            'role' => DB::table('role')
                ->where('id', $user_req->role_id)
                ->first(),
            'token' => $token_create->accessToken, //generate token session untuk user
            'expired_at' => Carbon::parse($token_create->token->expires_at)->format('M d y H:i:s'),
        );
    }

    private function handle_exists_user_by_username($req_login, $user): bool
    {
        if ($this->handle_where_exists_by_username_or_email('username', $user, $req_login['umail'])) {
            return true;
        }
        return false;
    }

    private function handle_exists_user_by_email($req_login, $user): bool
    {
        if ($this->handle_where_exists_by_username_or_email('email', $user, $req_login['umail'])) {
            return true;
        }
        return false;
    }

    private function handle_exists_user_by_password($req_login, $user_req): bool
    {
        if (Hash::check($req_login['password'], $user_req->password)) {
            return true;
        }
        return false;
    }

    public function register($register, $user, $response)
    {
        $register['password'] = Hash::make($register['password']);
        $register['role_id'] = 1; //role default user is (1)

        $validate_existing_email = $this->handle_validate_existing_email($register, $user);
        if (!$validate_existing_email) {

            $validate_strings_input = $this->handle_validate_strings_inputs($register);
            if (!$validate_strings_input) {
                $submit = $this->handle_map_register_by_username($register);
            }

            if ($validate_strings_input) {
                $submit = $this->handle_map_register_by_email($register);
            }
            return $response->success_response($user->create($submit), 'Successfully Register');
        }

        if ($validate_existing_email) {
            return $response->error_response('Email has been already', 422);
        }
    }

    public function logout($user_session)
    {
        $token = $user_session->user()->token();
        $token->delete();
        return $token;
    }

    public function profile($profile)
    {
        return $profile->user();
    }

    private function handle_map_register_by_username(array $register): array
    {
        return array(
            'nama_lengkap' => $register['nama_lengkap'],
            'password' => $register['password'],
            'role_id' => $register['role_id'],
            'username' => $register['umail'],
            'created_at' => date('Y-m-d H:i:s'),
        );
    }
    private function handle_map_register_by_email(array $register): array
    {
        return array(
            'nama_lengkap' => $register['nama_lengkap'],
            'password' => $register['password'],
            'role_id' => $register['role_id'],
            'email' => $register['umail'],
            'created_at' => date('Y-m-d H:i:s'),
        );
    }

    private function handle_validate_strings_inputs(array $register): bool
    {
        if (Str::contains($register['umail'], '@')) {
            return true; //email
        }
        return false; //username
    }

    private function handle_validate_existing_email(array $register, $user): bool
    {
        if ($user->where('email', $register['umail'])->first()) {
            return true;
        }
        return false;
    }
}
