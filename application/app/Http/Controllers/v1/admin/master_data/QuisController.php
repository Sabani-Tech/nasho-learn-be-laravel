<?php

namespace App\Http\Controllers\v1\admin\master_data;

use App\Http\Controllers\Controller;
use App\Http\Requests\v1\admin\master_data\QuisRequest;
use App\Repositories\v1\admin\master_data\EloquentQuisRepositories;
use Illuminate\Http\Request;

class QuisController
{
    public function __construct(
        private EloquentQuisRepositories $eloquentQuisRepositories,
        private Controller $controller,
    ) {}
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        return $this->eloquentQuisRepositories->index($request);
    }
    /**
     * Store a newly created resource in storage.
     */
    public function store(QuisRequest $quisRequest)
    {
        $materi = $quisRequest->validated();
        $materi = $this->eloquentQuisRepositories->store($quisRequest->safe()->only(['title', 'question', 'point', 'option', 'kategori_materi_id', 'materi_id', 'batch', 'answer_key']), $this->controller);
        return $materi;
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return $this->eloquentQuisRepositories->show($id, $this->controller);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(QuisRequest $quisRequest, string $id)
    {
        $materi = $quisRequest->validated();
        $materi = $this->eloquentQuisRepositories->update($quisRequest->safe()->only(['title', 'question', 'point', 'option', 'kategori_materi_id', 'materi_id', 'batch', 'answer_key']), $id, $this->controller);
        return $materi;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        return $this->eloquentQuisRepositories->delete($id, $this->controller);
    }
}
