<?php

namespace App\Http\Controllers\v1\user\auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\v1\user\auth\LoginRequest;
use App\Http\Requests\v1\user\auth\RegisterRequest;
use App\Models\User;
use App\Repositories\v1\user\auth\EloquentUserAuthRepositories;
use Illuminate\Http\Request;

class UserAuthController
{
    //construct injection (inject repositories users ke dalam construct)
    public function __construct(
        private EloquentUserAuthRepositories $eloquentUserAuthRepositories,
        private User $user,
        private Controller $controller,
    ) {}

    public function login(LoginRequest $request)
    {
        return $this->handle_validate_auth_childs('login', $request);
    }

    public function register(RegisterRequest $request)
    {
        return $this->handle_validate_auth_childs('register', $request);
    }

    public function logout(Request $request)
    {
        return $this->controller->success_response($this->eloquentUserAuthRepositories->logout($request), 'Berhasil logout');
    }

    private function handle_validate_auth_childs($type, $request)
    {
        if ($type == 'login') {
            $validate = $request->validated();
            $validate = $this->eloquentUserAuthRepositories->login($validate, $this->user, $this->controller);
        }

        if ($type == 'register') {
            $validate = $request->validated();
            $validate = $request->safe()->only(['umail', 'nama_lengkap', 'password', 'role_id']);
            $validate = $this->eloquentUserAuthRepositories->register($validate, $this->user, $this->controller);
        }

        return $validate;
    }

    public function profile()
    {
        return $this->controller->success_response($this->eloquentUserAuthRepositories->profile($this->user), 'Berhasil get profile');
    }
}
