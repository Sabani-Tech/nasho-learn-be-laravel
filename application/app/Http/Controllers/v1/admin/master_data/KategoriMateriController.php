<?php

namespace App\Http\Controllers\v1\admin\master_data;

use App\Http\Controllers\Controller;
use App\Http\Requests\v1\admin\master_data\KategoriMateriRequest;
use App\Repositories\v1\admin\master_data\KategoriMateriRepositories;
use Illuminate\Http\Request;

class KategoriMateriController extends Controller
{
    public function __construct(
        private KategoriMateriRepositories $kategoriMateriRepositories
    ) {}
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        return $this->kategoriMateriRepositories->index($request);
    }
    /**
     * Store a newly created resource in storage.
     */
    public function store(KategoriMateriRequest $kategoriMateriRequest)
    {
        $materi = $kategoriMateriRequest->validated();
        $materi = $this->kategoriMateriRepositories->store($kategoriMateriRequest->safe()->only(['jenis', 'deskripsi']));
        return $materi;
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return $this->kategoriMateriRepositories->show($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(KategoriMateriRequest $kategoriMateriRequest, string $id)
    {
        $materi = $kategoriMateriRequest->validated();
        $materi = $this->kategoriMateriRepositories->update($kategoriMateriRequest->safe()->only(['jenis', 'deskripsi']), $id);
        return $materi;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        return $this->kategoriMateriRepositories->delete($id);
    }
}
