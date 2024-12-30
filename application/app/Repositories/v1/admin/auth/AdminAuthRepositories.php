<?php

namespace App\Repositories\v1\admin\auth;

interface AdminAuthRepositories
{
    public function login($login, $user, $response);
    public function logout($admin_session);
    public function profile($profile);
}
