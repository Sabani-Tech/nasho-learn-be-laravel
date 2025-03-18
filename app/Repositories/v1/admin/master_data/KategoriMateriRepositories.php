<?php

namespace App\Repositories\v1\admin\master_data;

interface KategoriMateriRepositories
{
    public function index($request);
    public function show($uid_kategori_materi, $response);
    public function store($kategori_materi, $response);
    public function update($kategori_materi, $uid_kategori_materi, $response);
    public function delete($uid_materi, $response);
}
