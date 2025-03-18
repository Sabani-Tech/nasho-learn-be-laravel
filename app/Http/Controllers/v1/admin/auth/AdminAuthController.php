<?php

namespace App\Http\Controllers\v1\admin\auth;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\v1\admin\auth\LoginRequest;
use App\Repositories\v1\admin\auth\EloquentAdminAuthRepositories;

class AdminAuthController
{
    //construct injection (inject repositories admin ke dalam construct)
    public function __construct(
        private EloquentAdminAuthRepositories $eloquentAdminAuthRepositories,
        private User $user,
        private Controller $controller,
    ) {}

    public function login(LoginRequest $request)
    {
        return $this->handle_validate_auth_childs('login', $request);
    }

    public function logout(Request $request)
    {
        return $this->controller->success_response($this->eloquentAdminAuthRepositories->logout($request), 'Berhasil logout');
    }

    private function handle_validate_auth_childs($type, $request)
    {
        if ($type == 'login') {
            $validate = $request->validated();
            $validate = $this->eloquentAdminAuthRepositories->login($validate, $this->user, $this->controller);
        }

        return $validate;
    }

    public function profile()
    {
        return $this->controller->success_response($this->eloquentAdminAuthRepositories->profile($this->user), 'Berhasil get profile');
    }
}
