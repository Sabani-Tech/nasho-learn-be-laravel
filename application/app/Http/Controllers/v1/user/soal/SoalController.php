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
        return $this->soalRepositories->Exam($category_id, $request);
    }

    //submit quis and exam
    public function quisSubmit($category_id, $materi_id, Request $request)
    {
        //validation
        $validator = Validator::make($request->all(), [
            'request' => 'required|array'
        ]);
        if ($validator->fails()) {
            return $this->error_response($validator->errors());
        }
        //body request
        $REQUEST_POST = $request->post('request');
        return $this->soalRepositories->QuisSubmit($category_id, $materi_id, $REQUEST_POST);
    }

    public function examSubmit($category_id, Request $request)
    {
        return $this->soalRepositories->ExamSubmit($category_id, $request);
    }
}
