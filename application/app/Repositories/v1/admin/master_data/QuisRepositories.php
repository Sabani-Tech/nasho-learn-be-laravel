<?php

namespace App\Repositories\v1\admin\master_data;

interface QuisRepositories
{
    public function index($request);
    public function show($id_quis, $response);
    public function store($quis, $response);
    public function update($quis, $id_quis, $response);
    public function delete($soal_id, $response);
}
