<?php

namespace App\Http\Controllers\v1\admin\master_data;

use App\Http\Controllers\Controller;
use App\Http\Requests\v1\admin\master_data\MateriRequest;
use App\Repositories\v1\admin\master_data\MateriRepositories;
use Illuminate\Http\Request;

class MateriController extends Controller
{
    public function __construct(
        private MateriRepositories $materiRepositories
    ) {}
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        return $this->materiRepositories->index($request);
    }
    /**
     * Store a newly created resource in storage.
     */
    public function store(MateriRequest $materiRequest)
    {
        $materi = $materiRequest->validated();
        $materi = $this->materiRepositories->store($materiRequest->safe()->only(['embed', 'judul', 'phase', 'isi', 'file_uri', 'kategori_materi_id', 'permalink', 'urutan']));
        return $materi;
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return $this->materiRepositories->show($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(MateriRequest $materiRequest, string $id)
    {
        $materi = $materiRequest->validated();
        $materi = $this->materiRepositories->update($materiRequest->safe()->only(['embed', 'judul', 'phase', 'isi', 'file_uri', 'kategori_materi_id', 'permalink', 'urutan']), $id);
        return $materi;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        return $this->materiRepositories->delete($id);
    }
}
