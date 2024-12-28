<?php

namespace App\Repositories\v1\admin\master_data;

interface UserManagementRepositories
{
    public function index($request);
    public function show($id_user, $response);
    public function store($user, $response);
    public function update($user, $id_user, $response);
    public function delete($id_user, $response);
}
