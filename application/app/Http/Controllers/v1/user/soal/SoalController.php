<?php

namespace App\Http\Controllers\v1\user\soal;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Repositories\v1\user\soal\SoalRepositories;

class SoalController extends Controller
{
    public function __construct(
        private SoalRepositories $soalRepositories
    ) {}
    public function quis($category_id, $materi_id)
    {
        return $this->soalRepositories->Quis($category_id, $materi_id);
    }

    public function exam($category_id, Request $request)
    {
        return $this->soalRepositories->Exam($category_id, $request);
    }
}
