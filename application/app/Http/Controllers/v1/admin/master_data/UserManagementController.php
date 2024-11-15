<?php

namespace App\Http\Controllers\v1\admin\master_data;

use App\Http\Controllers\Controller;
use App\Http\Requests\v1\admin\master_data\UserManagementRequest;
use App\Repositories\v1\admin\master_data\UserManagementRepositories;
use Illuminate\Http\Request;

class UserManagementController extends Controller
{
    public function __construct(
        private UserManagementRepositories $userManagementRepositories
    ) {}
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        return $this->userManagementRepositories->index($request);
    }
    /**
     * Store a newly created resource in storage.
     */
    public function store(UserManagementRequest $userManagementRequest)
    {
        $materi = $userManagementRequest->validated();
        $materi = $this->userManagementRepositories->store($userManagementRequest->safe()->only(['nama_lengkap', 'email', 'username', 'password', 'role_id']));
        return $materi;
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return $this->userManagementRepositories->show($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UserManagementRequest $userManagementRequest, string $id)
    {
        $materi = $userManagementRequest->validated();
        $materi = $this->userManagementRepositories->update($userManagementRequest->safe()->only(['nama_lengkap', 'email', 'username', 'password', 'role_id']), $id);
        return $materi;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        return $this->userManagementRepositories->delete($id);
    }
}
