<?php

namespace App\Repositories\v1\user\soal;

//interface for Repositories
interface SoalRepositories
{
    public function Quis($category_id, $materi_id, $response);
    public function QuisSubmit($category_id, $materi_id, $REQUEST_POST, $response);
    public function QuisResult($category_id, $materi_id, $response);
    public function Exam($category_id, $request, $response);
    public function ExamSubmit($category_id, $REQUEST_POST, $REQUEST_GET_PHASE, $response);
    public function ExamResult($category_id, $REQUEST_GET_PHASE, $response);
}
