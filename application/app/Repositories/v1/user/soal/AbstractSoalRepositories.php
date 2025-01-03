<?php

namespace App\Repositories\v1\user\soal;

use App\Models\CategoryMateri;
use App\Models\CategoryMateriDetail;
use App\Models\QuisModel;
use App\Models\UjianModel;
use App\Models\ExamAnswerModel;
use App\Models\QuisAnswerModel;
use App\Models\Materi;

abstract class AbstractSoalRepositories
{
    protected $quis_model,
        $ujian_model,
        $quis_answer_model,
        $exam_answer_model,
        $category_materi_detail,
        $category_materi,
        $materi;
    public function __construct()
    {
        $this->quis_model = new QuisModel();
        $this->ujian_model = new UjianModel();
        $this->quis_answer_model = new QuisAnswerModel();
        $this->exam_answer_model = new ExamAnswerModel();
        $this->category_materi = new CategoryMateri();
        $this->category_materi_detail = new CategoryMateriDetail();
        $this->materi = new Materi();
    }
    /**
     * @var string CONSTANT_EXAM1_STATUS this exam1 status true if passed exam1 
     */
    protected const CONSTANT_EXAM1_STATUS = 'true';
    /**
     * @var string CONSTANT_EXAM2_STATUS this exam1 status true if passed exam2
     */
    protected const CONSTANT_EXAM2_STATUS = 'true';
    /**
     * @var string CONSTANT_STATUS_UNLOCK_EXAM2 this exam1 status true if passed exam2
     */
    protected const CONSTANT_STATUS_UNLOCK_EXAM2 = 'Exam2';
}
