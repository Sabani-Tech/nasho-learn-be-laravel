<?php

namespace App\Repositories\v1\user\auth;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserAuthRepositories extends Controller
{
    private function handle_where_exists_by_username_or_password($type, $user, $req)
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

    public function login($login, $user)
    {
        if ($this->handle_exists_user_by_username($login, $user)) {
            $user_req = $this->handle_where_exists_by_username_or_password('username', $user, $login['umail']);
        } else if ($this->handle_exists_user_by_email($login, $user)) {
            $user_req = $this->handle_where_exists_by_username_or_password('email', $user, $login['umail']);
        } else {
            return $this->error_response('Email/username salah');
        }

        if ($this->handle_exists_user_by_password($login, $user_req)) {
            return $this->success_response($this->handle_mapping_user_login($user_req), 'Berhasil Login');
        } else {
            return $this->error_response('password salah salah');
        }
    }

    private function handle_exists_user_by_username($req_login, $user): bool
    {
        if ($this->handle_where_exists_by_username_or_password('username', $user, $req_login['umail'])) {
            return true;
        }
        return false;
    }

    private function handle_exists_user_by_email($req_login, $user): bool
    {
        if ($this->handle_where_exists_by_username_or_password('email', $user, $req_login['umail'])) {
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
        $validate = array(
            'nama_lengkap' => $validate_register['nama_lengkap'],
            'email' => $validate_register['email'],
            'username' => $validate_register['username'],
            'password' => Hash::make($validate_register['password']),
            'role_id' => 1, //role default user is (1)
        );

        return $user->create($validate);
    }
}
