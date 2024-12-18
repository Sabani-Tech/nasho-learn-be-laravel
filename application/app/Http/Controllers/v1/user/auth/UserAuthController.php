<?php

namespace App\Http\Controllers\v1\user\auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\v1\user\auth\LoginRequest;
use App\Http\Requests\v1\user\auth\RegisterRequest;
use App\Models\User;
use App\Repositories\v1\user\auth\UserAuthRepositories;
use Illuminate\Http\Request;

class UserAuthController extends Controller
{
    //construct injection (inject repositories users ke dalam construct)
    public function __construct(
        private UserAuthRepositories $user_repositories,
        private User $user,
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
        return $this->success_response($this->user_repositories->logout($request), 'Berhasil logout');
    }

    private function handle_validate_auth_childs($type, $request)
    {
        if ($type == 'login') {
            $validate = $request->validated();
            $validate = $this->user_repositories->login($validate, $this->user);
        }

        if ($type == 'register') {
            $validate = $request->validated();
            $validate = $request->safe()->only(['umail', 'nama_lengkap', 'password', 'role_id']);
            $validate = $this->user_repositories->register($validate, $this->user);
        }

        return $validate;
    }

    public function profile()
    {
        return $this->success_response($this->user_repositories->profile($this->user), 'Berhasil get profile');
    }
}
