<?php

namespace App\Repositories\v1\admin\master_data;

interface MateriRepositories
{
    public function index($request);
    public function show($permalink_materi, $response);
    public function store($materi, $response);
    public function update($materi, $permalink_materi, $response);
    public function delete($permalink_materi, $response);
}
