<?php

namespace App\Http\Controllers\v1\admin\master_data;

use App\Http\Controllers\Controller;
use App\Http\Requests\v1\admin\master_data\UjianRequest;
use App\Repositories\v1\admin\master_data\UjianRepositories;
use Illuminate\Http\Request;

class UjianController extends Controller
{
    public function __construct(
        private UjianRepositories $ujianRepositories
    ) {}
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        return $this->ujianRepositories->index($request);
    }
    /**
     * Store a newly created resource in storage.
     */
    public function store(UjianRequest $quisRequest)
    {
        $materi = $quisRequest->validated();
        $materi = $this->ujianRepositories->store($quisRequest->safe()->only(['title', 'question', 'point', 'option', 'phase', 'kategori_materi_id']));
        return $materi;
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return $this->ujianRepositories->show($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UjianRequest $ujianRequest, string $id)
    {
        $materi = $ujianRequest->validated();
        $materi = $this->ujianRepositories->update($ujianRequest->safe()->only(['title', 'question', 'point', 'option', 'phase', 'kategori_materi_id']), $id);
        return $materi;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        return $this->ujianRepositories->delete($id);
    }
}
