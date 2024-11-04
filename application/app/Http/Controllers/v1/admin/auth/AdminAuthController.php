<?php

namespace App\Http\Controllers\v1\admin\auth;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\v1\admin\auth\LoginRequest;
use App\Repositories\v1\admin\auth\AdminAuthRepositories;

class AdminAuthController extends Controller
{
    //construct injection (inject repositories admin ke dalam construct)
    public function __construct(
        private AdminAuthRepositories $admin_repositories,
        private User $user,
    ) {}

    public function login(LoginRequest $request)
    {
        return $this->handle_validate_auth_childs('login', $request);
    }

    public function logout(Request $request)
    {
        return $this->success_response($this->admin_repositories->logout($request), 'Berhasil logout');
    }

    private function handle_validate_auth_childs($type, $request)
    {
        if ($type == 'login') {
            $validate = $request->validated();
            $validate = $this->admin_repositories->login($validate, $this->user);
        }

        return $validate;
    }

    public function profile()
    {
        return $this->success_response($this->admin_repositories->profile($this->user), 'Berhasil get profile');
    }
}
