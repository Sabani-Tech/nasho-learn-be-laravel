<?php

namespace App\Http\Controllers\v1\user\soal;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Repositories\v1\user\soal\SoalRepositories;
use Illuminate\Support\Facades\Validator;

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
        $REQUEST_GET = $request->query('phase');
        return $this->soalRepositories->Exam($category_id, $REQUEST_GET);
    }

    /**
     * result,submit(quis and exam)
     */
    //quis
    public function quisSubmit($category_id, $materi_id, Request $request)
    {
        $REQUEST_POST = $request->post();
        return $this->soalRepositories->QuisSubmit($category_id, $materi_id, $REQUEST_POST);
    }

    public function quisResult($category_id, $materi_id)
    {
        return $this->soalRepositories->QuisResult($category_id, $materi_id);
    }

    public function examSubmit($category_id, Request $request)
    {
        $REQUEST_POST = $request->post();
        $REQUEST_GET_PHASE = $request->query('phase');
        return $this->soalRepositories->ExamSubmit($category_id, $REQUEST_POST, $REQUEST_GET_PHASE);
    }

    public function examResult($category_id, Request $request)
    {
        $REQUEST_GET_PHASE = $request->query('phase');
        return $this->soalRepositories->ExamResult($category_id, $REQUEST_GET_PHASE);
    }
}
