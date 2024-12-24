<?php

namespace App\Http\Controllers\v1\admin\master_data;

use App\Http\Controllers\Controller;
use App\Http\Requests\v1\admin\master_data\QuisRequest;
use App\Repositories\v1\admin\master_data\QuisRepositories;
use Illuminate\Http\Request;

class QuisController extends Controller
{
    public function __construct(
        private QuisRepositories $quisRepositories
    ) {}
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        return $this->quisRepositories->index($request);
    }
    /**
     * Store a newly created resource in storage.
     */
    public function store(QuisRequest $quisRequest)
    {
        $materi = $quisRequest->validated();
        $materi = $this->quisRepositories->store($quisRequest->safe()->only(['title', 'question', 'point', 'option', 'kategori_materi_id', 'materi_id', 'batch', 'answer_key']));
        return $materi;
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return $this->quisRepositories->show($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(QuisRequest $quisRequest, string $id)
    {
        $materi = $quisRequest->validated();
        $materi = $this->quisRepositories->update($quisRequest->safe()->only(['title', 'question', 'point', 'option', 'kategori_materi_id', 'materi_id', 'batch', 'answer_key']), $id);
        return $materi;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        return $this->quisRepositories->delete($id);
    }
}
