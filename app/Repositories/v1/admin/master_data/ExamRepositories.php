<?php

namespace App\Repositories\v1\admin\master_data;

interface ExamRepositories
{
    public function index($request);
    public function show($id_ujian, $response);
    public function store($ujian, $response);
    public function update($ujian, $id_ujian, $response);
    public function delete($soal_id, $response);
}
