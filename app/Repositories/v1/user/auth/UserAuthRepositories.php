<?php

namespace App\Repositories\v1\user\auth;

interface UserAuthRepositories
{
    public function login($login, $user, $response);
    public function logout($user_session);
    public function register($register, $user, $response);
    public function profile($profile);
}
