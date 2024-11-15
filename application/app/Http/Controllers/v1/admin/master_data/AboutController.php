<?php

namespace App\Http\Controllers\v1\admin\master_data;

use App\Http\Controllers\Controller;
use App\Http\Requests\v1\admin\master_data\AboutRequest;
use App\Repositories\v1\admin\master_data\AboutRepositories;
use Illuminate\Http\Request;

class AboutController extends Controller
{
    public function __construct(
        private AboutRepositories $aboutRepositories
    ) {}
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        return $this->aboutRepositories->index($request);
    }
    /**
     * Store a newly created resource in storage.
     */
    public function store(AboutRequest $aboutRequest)
    {
        $materi = $aboutRequest->validated();
        $materi = $this->aboutRepositories->store($aboutRequest->safe()->only(['content']));
        return $materi;
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return $this->aboutRepositories->show($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(AboutRequest $aboutRequest, string $id)
    {
        $materi = $aboutRequest->validated();
        $materi = $this->aboutRepositories->update($aboutRequest->safe()->only(['content']), $id);
        return $materi;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        return $this->aboutRepositories->delete($id);
    }
}
