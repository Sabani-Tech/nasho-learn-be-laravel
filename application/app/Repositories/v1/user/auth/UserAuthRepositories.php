<?php

namespace App\Repositories\v1\user\auth;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserAuthRepositories extends Controller
{
    public function login($login, $user)
    {
        if ($this->handle_exists_user_by_username($login, $user)) {
            $user_req = $this->handle_where_exists_by_username_or_email('username', $user, $login['umail']);
        } else if ($this->handle_exists_user_by_email($login, $user)) {
            $user_req = $this->handle_where_exists_by_username_or_email('email', $user, $login['umail']);
        } else {
            return $this->error_response('Email/username salah');
        }

        if ($this->handle_exists_user_by_password($login, $user_req)) {
            if (!$this->handle_validate_role_after_do_login($user_req)) {
                return $this->error_response('anda bukan user');
            }

            if ($this->handle_validate_role_after_do_login($user_req)) {
                return $this->success_response($this->handle_mapping_user_login($user_req), 'Berhasil Login');
            }
        } else {
            return $this->error_response('password salah');
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

    public function register($validate_register, $user)
    {
        $validate_register['password'] = Hash::make($validate_register['password']);
        $validate_register['role_id'] = 1; //role default user is (1)
        return $user->create($validate_register);
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
}
