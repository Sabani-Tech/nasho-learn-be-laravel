<?php

namespace App\Repositories\v1\user\auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;

class UserAuthRepositories
{
    public function login() {}

    public function register($validate_register, $user)
    {
        $validate = array(
            'nama_lengkap' => $validate_register['nama_lengkap'],
            'email' => $validate_register['email'],
            'username' => $validate_register['username'],
            'password' => Hash::make($validate_register['password']),
            'role_id' => 'a39652d4-9a5e-11ef-924d-8b0b95c9329f',
        );

        return $user->create($validate);
    }
}
