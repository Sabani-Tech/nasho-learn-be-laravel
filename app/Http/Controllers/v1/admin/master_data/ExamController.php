<?php

namespace App\Http\Controllers\v1\admin\master_data;

use App\Http\Controllers\Controller;
use App\Http\Requests\v1\admin\master_data\UjianRequest;
use App\Repositories\v1\admin\master_data\EloquentExamRepositories;
use Illuminate\Http\Request;

class ExamController
{
    public function __construct(
        private EloquentExamRepositories $eloquentExamRepositories,
        private Controller $controller,
    ) {}
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        return $this->eloquentExamRepositories->index($request);
    }
    /**
     * Store a newly created resource in storage.
     */
    public function store(UjianRequest $quisRequest)
    {
        $materi = $quisRequest->validated();
        $materi = $this->eloquentExamRepositories->store($quisRequest->safe()->only(['title', 'question', 'point', 'option', 'phase', 'kategori_materi_id', 'batch']), $this->controller);
        return $materi;
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return $this->eloquentExamRepositories->show($id, $this->controller);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UjianRequest $ujianRequest, string $id)
    {
        $materi = $ujianRequest->validated();
        $materi = $this->eloquentExamRepositories->update($ujianRequest->safe()->only(['title', 'question', 'point', 'option', 'phase', 'kategori_materi_id', 'batch']), $id, $this->controller);
        return $materi;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        return $this->eloquentExamRepositories->delete($id, $this->controller);
    }
}
