<?php

namespace App\Http\Controllers\v1\admin\master_data;

use App\Http\Controllers\Controller;
use App\Http\Requests\v1\admin\master_data\SoalRequest;
use App\Repositories\v1\admin\master_data\SoalRepositories;
use Illuminate\Http\Request;

class SoalController extends Controller
{
    public function __construct(
        private SoalRepositories $soalRepositories
    ) {}
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        return $this->soalRepositories->index($request);
    }
    /**
     * Store a newly created resource in storage.
     */
    public function store(SoalRequest $soalRequest)
    {
        $materi = $soalRequest->validated();
        $materi = $this->soalRepositories->store($soalRequest->safe()->only(['title', 'question', 'point', 'option']));
        return $materi;
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return $this->soalRepositories->show($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(SoalRequest $soalRequest, string $id)
    {
        $materi = $soalRequest->validated();
        $materi = $this->soalRepositories->update($soalRequest->safe()->only(['title', 'question', 'point', 'option']), $id);
        return $materi;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        return $this->soalRepositories->delete($id);
    }
}
