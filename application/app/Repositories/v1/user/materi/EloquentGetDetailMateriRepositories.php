<?php

namespace App\Repositories\v1\user\materi;

use App\Http\Resources\MateriDetailResource;
use App\Models\Materi;

//Repository
class EloquentGetDetailMateriRepositories implements MateriRepositories
{
    private $materi_model;
    public function __construct()
    {
        $this->materi_model = new Materi();
    }

    public function Index($materi_id, $controller)
    {
        if (!$this->HandleValidateIdMateri($materi_id)) {
            return $controller->error_response('Materi not found');
        }

        return $controller->success_response(new MateriDetailResource($this->HandleGetMateriById($materi_id)), 'Successfully Detail Materi');
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
