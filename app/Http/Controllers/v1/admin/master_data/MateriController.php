<?php

namespace App\Http\Controllers\v1\admin\master_data;

use App\Http\Controllers\Controller;
use App\Http\Requests\v1\admin\master_data\MateriRequest;
use App\Repositories\v1\admin\master_data\EloquentMateriRepositories;
use Illuminate\Http\Request;

class MateriController extends Controller
{
    public function __construct(
        private EloquentMateriRepositories $eloquentMateriRepositories,
        private Controller $controller,
    ) {}
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        return $this->eloquentMateriRepositories->index($request);
    }
    /**
     * Store a newly created resource in storage.
     */
    public function store(MateriRequest $materiRequest)
    {
        $materi = $materiRequest->validated();
        $materi = $this->eloquentMateriRepositories->store($materiRequest->safe()->only(['embed', 'judul', 'phase', 'isi', 'file_uri', 'kategori_materi_id', 'permalink', 'urutan', 'quis_status']), $this->controller);
        return $materi;
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return $this->eloquentMateriRepositories->show($id, $this->controller);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(MateriRequest $materiRequest, string $id)
    {
        $materi = $materiRequest->validated();
        $materi = $this->eloquentMateriRepositories->update($materiRequest->safe()->only(['embed', 'judul', 'phase', 'isi', 'file_uri', 'kategori_materi_id', 'permalink', 'urutan', 'quis_status']), $id, $this->controller);
        return $materi;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        return $this->eloquentMateriRepositories->delete($id, $this->controller);
    }
}
