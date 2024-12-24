<?php

namespace App\Repositories\v1\user\materi;

use App\Http\Controllers\Controller;
use App\Http\Resources\MateriDetailResource;
use App\Repositories\v1\user\materi\Models\Materi;

//Repository
class MateriRepositories extends Controller
{
    private $materi_model;
    public function __construct()
    {
        $this->materi_model = new Materi();
    }
    public function Index($materi_id)
    {
        if (!$this->HandleValidateIdMateri($materi_id)) {
            return $this->error_response('Materi not found');
        }

        return $this->success_response(new MateriDetailResource($this->HandleGetMateriById($materi_id)), 'Successfully Detail Materi');
    }

    private function HandleValidateIdMateri($materi_id): bool
    {
        return !$this->materi_model->whereId($materi_id)->exists() ? false : true;
    }

    private function HandleGetMateriById($materi_id)
    {
        return $this->materi_model->whereId($materi_id)->first();
    }
}
