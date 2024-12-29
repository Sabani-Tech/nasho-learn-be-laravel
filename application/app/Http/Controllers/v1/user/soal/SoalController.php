<?php

namespace App\Http\Controllers\v1\user\soal;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Repositories\v1\user\soal\EloquentSoalRepositories;

class SoalController
{
    public function __construct(
        private EloquentSoalRepositories $eloquentSoalRepositories,
        private Controller $controller
    ) {}
    public function quis($category_id, $materi_id)
    {
        return $this->eloquentSoalRepositories->Quis($category_id, $materi_id, $this->controller);
    }

    public function exam($category_id, Request $request)
    {
        $REQUEST_GET = $request->query('phase');
        return $this->eloquentSoalRepositories->Exam($category_id, $REQUEST_GET, $this->controller);
    }

    /**
     * result,submit(quis and exam)
     */
    //quis
    public function quisSubmit($category_id, $materi_id, Request $request)
    {
        $REQUEST_POST = $request->post();
        return $this->eloquentSoalRepositories->QuisSubmit($category_id, $materi_id, $REQUEST_POST, $this->controller);
    }

    public function quisResult($category_id, $materi_id)
    {
        return $this->eloquentSoalRepositories->QuisResult($category_id, $materi_id, $this->controller);
    }

    public function examSubmit($category_id, Request $request)
    {
        $REQUEST_POST = $request->post();
        $REQUEST_GET_PHASE = $request->query('phase');
        return $this->eloquentSoalRepositories->ExamSubmit($category_id, $REQUEST_POST, $REQUEST_GET_PHASE, $this->controller);
    }

    public function examResult($category_id, Request $request)
    {
        $REQUEST_GET_PHASE = $request->query('phase');
        return $this->eloquentSoalRepositories->ExamResult($category_id, $REQUEST_GET_PHASE, $this->controller);
    }
}
