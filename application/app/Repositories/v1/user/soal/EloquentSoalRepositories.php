<?php

namespace App\Repositories\v1\user\soal;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Http\Resources\PembahasanExamResource;
use App\Http\Resources\PembahasanQuisResource;

//Repositories
class EloquentSoalRepositories extends AbstractSoalRepositories implements SoalRepositories
{
    public function Quis($category_id, $materi_id, $response)
    {
        if (!$this->HandleValidateQuisCategoryById($category_id)) {
            return $response->error_response('Category Not Found');
        }
        if (!$this->HandleValidateQuisMateriById($materi_id)) {
            return $response->error_response('Materi Not Found');
        }

        return $response->success_response($this->HandleGetQuisByCategoryIdAndMateriId($this->quis_model, $category_id, $materi_id));
    }

    public function Exam($category_id, $request, $response)
    {
        if (!$this->HandleValidateUjianCategoryById($category_id)) {
            return $response->error_response('Category Not Found');
        }

        return $response->success_response($this->HandleGetUjianByCategoryId($this->ujian_model, $category_id, $request));
    }

    //handler ujian
    private function HandleValidateUjianCategoryById($category_id): bool
    {
        if (!$this->ujian_model->where('kategori_materi_id', $category_id)->first()) {
            return false;
        }
        return true;
    }

    private function HandleGetUjianByCategoryId($ujian_model, $category_id, $request)
    {
        $RandBatch = rand(1, 3);
        return $ujian_model->where([
            ['kategori_materi_id', '=', $category_id],
            ['phase', '=', $request],
            ['batch', '=', $RandBatch],
        ])->limit(10)->get();
    }

    //handler quis
    private function HandleValidateQuisCategoryById($category_id): bool
    {
        if (!$this->quis_model->where('kategori_materi_id', $category_id)->first()) {
            return false;
        }
        return true;
    }
    private function HandleValidateQuisMateriById($materi_id): bool
    {
        if (!$this->quis_model->where('materi_id', $materi_id)->first()) {
            return false;
        }
        return true;
    }

    private function HandleGetQuisByCategoryIdAndMateriId($quis_model, $category_id, $materi_id)
    {
        $RandBatch = rand(1, 3);
        $QuisModel = $quis_model->where([
            ['kategori_materi_id', '=', $category_id],
            ['materi_id', '=', $materi_id],
            ['batch', '=', $RandBatch],
        ])->limit(5)->get(); //untuk quis menampilkan 5 soal dengan point 20
        return $QuisModel;
    }

    /**
     * Handler Submit(Quis And Exam)
     */

    //quis
    public function QuisSubmit($category_id, $materi_id, $REQUEST_POST, $response)
    {
        if (!$this->HandleValidateQuisCategoryById($category_id)) {
            return $response->error_response('Category Not Found');
        }
        if (!$this->HandleValidateQuisMateriById($materi_id)) {
            return $response->error_response('Materi Not Found');
        }

        return $this->_GetRequestQuisSubmit($REQUEST_POST, $category_id, $materi_id, $response);
    }

    private function _SetRequestQuisSubmit($REQUEST_POST, $category_id, $materi_id): array
    {
        $CollectAnswer = [];
        foreach ($REQUEST_POST as $quis) {
            $quis['point'] = $this->quis_model->where([
                ['kategori_materi_id', '=', $category_id],
                ['materi_id', '=', $materi_id],
                ['id', '=', $quis['quis_id']]
            ])->first()->answer_key == $quis['answer']['key'] ? $quis['point'] : 0; //mencocokan jawaban user dengan kunci jawaban dari soal: jika benar maka point full:20 akan tetapi jika salah point 0
            $quis['answer'] = $quis['answer']['key'];
            $quis['users_id'] = Auth::guard('api')->user()->id;
            $quis['kategori_materi_id'] = $category_id;
            $quis['materi_id'] = $materi_id;
            array_push($CollectAnswer, $quis);
        }
        return $CollectAnswer;
    }

    private function _GetRequestQuisSubmit($REQUEST_POST, $category_id, $materi_id, $response)
    {
        DB::beginTransaction();
        try {
            //cek data jika sudah menjawab soal by batch maka akan digantikan dengan soal batch berikutnya
            $RowAnswer = $this->quis_answer_model->where([
                ['kategori_materi_id', '=', $category_id],
                ['materi_id', '=', $materi_id],
                ['users_id', '=', Auth::guard('api')->user()->id],
            ]);
            if ($RowAnswer) {
                $RowAnswer->delete();
            }

            //submit quis
            DB::table('quis_answer')->insert($this->_SetRequestQuisSubmit($REQUEST_POST, $category_id, $materi_id));
            DB::commit();
            //return mapping quis
            return $response->success_response($this->HandleMappingSubmitQuis($category_id, $materi_id));
        } catch (\Exception $e) {
            DB::rollBack();
            return $response->error_response($e->getMessage());
        }
    }

    private function HandleMappingSubmitQuis($category_id, $materi_id): array
    {
        return array(
            'passed' => $this->quis_answer_model->where([
                ['kategori_materi_id', '=', $category_id],
                ['materi_id', '=', $materi_id],
                ['users_id', '=', Auth::guard('api')->user()->id],
            ])->sum('point') < 80 ? false : true,
            'correct_count' => $this->quis_answer_model->where([
                ['kategori_materi_id', '=', $category_id],
                ['materi_id', '=', $materi_id],
                ['users_id', '=', Auth::guard('api')->user()->id],
                ['point', '=', 20]
            ])->get()->count(),
            'incorrect_count' => $this->quis_answer_model->where([
                ['kategori_materi_id', '=', $category_id],
                ['materi_id', '=', $materi_id],
                ['users_id', '=', Auth::guard('api')->user()->id],
                ['point', '=', 0],
            ])->get()->count(),
            'score' => $this->quis_answer_model->where([
                ['kategori_materi_id', '=', $category_id],
                ['materi_id', '=', $materi_id],
                ['users_id', '=', Auth::guard('api')->user()->id],
            ])->sum('point'),
            'total_score' => 100,
            'title' => $this->materi
                ->whereId($materi_id)
                ->first()
                ->judul,
        );
    }

    public function QuisResult($category_id, $materi_id, $response)
    {
        try {
            if (!$this->HandleValidateQuisCategoryById($category_id)) {
                return $response->error_response('Category Not Found');
            }
            if (!$this->HandleValidateQuisMateriById($materi_id)) {
                return $response->error_response('Materi Not Found');
            }

            return $response->success_response(PembahasanQuisResource::collection($this->quis_answer_model->where([
                ['kategori_materi_id', '=', $category_id],
                ['materi_id', '=', $materi_id],
                ['users_id', '=', Auth::guard('api')->user()->id],
            ])->get()));
        } catch (\Exception $e) {
            return $response->error_response($e->getMessage());
        }
    }

    //exam

    public function ExamSubmit($category_id, $REQUEST_POST, $REQUEST_GET_PHASE, $response)
    {
        if (!$this->HandleValidateQuisCategoryById($category_id)) {
            return $response->error_response('Category Not Found');
        }

        return $this->_GetRequestExamSubmit($category_id, $REQUEST_POST, $REQUEST_GET_PHASE, $response);
    }

    public function ExamResult($category_id, $REQUEST_GET_PHASE, $response)
    {
        try {
            if (!$this->HandleValidateQuisCategoryById($category_id)) {
                return $response->error_response('Category Not Found');
            }

            return $response->success_response(PembahasanExamResource::collection($this->exam_answer_model->where([
                ['kategori_materi_id', '=', $category_id],
                ['phase', '=', $REQUEST_GET_PHASE],
                ['users_id', '=', Auth::guard('api')->user()->id],
            ])->get()));
        } catch (\Exception $e) {
            return $response->error_response($e->getMessage());
        }
    }

    private function _SetRequestExamSubmit($category_id, $REQUEST_POST, $REQUEST_GET_PHASE): array
    {
        $CollectAnswer = [];
        foreach ($REQUEST_POST as $exam) {
            $exam['point'] = $this->ujian_model->where([
                ['kategori_materi_id', '=', $category_id],
                ['phase', '=', $REQUEST_GET_PHASE],
                ['id', '=', $exam['exam_id']]
            ])->first()->answer_key == $exam['answer']['key'] ? $exam['point'] : 0; //mencocokan jawaban user dengan kunci jawaban dari soal jika bener maka point full:10 akan tetapi jika salah point:0
            $exam['answer'] = $exam['answer']['key'];
            $exam['users_id'] = Auth::guard('api')->user()->id;
            $exam['kategori_materi_id'] = $category_id;
            $exam['phase'] = $REQUEST_GET_PHASE;
            array_push($CollectAnswer, $exam);
        }
        return $CollectAnswer;
    }

    private function _GetRequestExamSubmit($category_id, $REQUEST_POST, $REQUEST_GET_PHASE, $response)
    {
        DB::beginTransaction();
        try {
            $RowAnswer = $this->exam_answer_model->where([
                ['kategori_materi_id', '=', $category_id],
                ['phase', '=', $REQUEST_GET_PHASE],
                ['users_id', '=', Auth::guard('api')->user()->id],
            ]);
            if ($RowAnswer) {
                $RowAnswer->delete();
            }

            //submit exam
            DB::table('exam_answer')->insert($this->_SetRequestExamSubmit($category_id, $REQUEST_POST, $REQUEST_GET_PHASE));
            // update status after passed exam phase 1 (uts) or exam phase 2 (uas)
            if (
                $this->HandleMappingSubmitExam($category_id, $REQUEST_GET_PHASE)['score'] >= 60 &&
                $this->HandleMappingSubmitExam($category_id, $REQUEST_GET_PHASE)['passed'] == true
            ) {
                switch ($REQUEST_GET_PHASE) {
                    case 1:
                        $this->HandleUpdateExamAndStatusAfterSubmitExamIfPassedPhase1($category_id);
                        break;
                    case 2:
                        $this->HandleUpdateExamAndStatusAfterSubmitExamIfPassedPhase2($category_id);
                        break;
                }
            }
            DB::commit();
            //return mapping exam
            return $response->success_response($this->HandleMappingSubmitExam($category_id, $REQUEST_GET_PHASE));
        } catch (\Exception $e) {
            DB::rollBack();
            return $response->error_response($e->getMessage());
        }
    }

    private function HandleMappingSubmitExam($category_id, $REQUEST_GET_PHASE): array
    {
        return array(
            'passed' => $this->exam_answer_model->where([
                ['kategori_materi_id', '=', $category_id],
                ['phase', '=', $REQUEST_GET_PHASE],
                ['users_id', '=', Auth::guard('api')->user()->id],
            ])->sum('point') >= 60 ? true : false,
            'correct_count' => $this->exam_answer_model->where([
                ['kategori_materi_id', '=', $category_id],
                ['phase', '=', $REQUEST_GET_PHASE],
                ['users_id', '=', Auth::guard('api')->user()->id],
                ['point', '=', 10],
            ])->get()->count(),
            'incorrect_count' => $this->exam_answer_model->where([
                ['kategori_materi_id', '=', $category_id],
                ['phase', '=', $REQUEST_GET_PHASE],
                ['users_id', '=', Auth::guard('api')->user()->id],
                ['point', '=', 0],
            ])->get()->count(),
            'score' => $this->exam_answer_model->where([
                ['kategori_materi_id', '=', $category_id],
                ['phase', '=', $REQUEST_GET_PHASE],
                ['users_id', '=', Auth::guard('api')->user()->id],
            ])->sum('point'),
            'total_score' => 100,
            'title' => $this->category_materi
                ->whereId($category_id)
                ->first()
                ->jenis,
        );
    }

    private function HandleUpdateExamAndStatusAfterSubmitExamIfPassedPhase1($category_id)
    {
        return $this->category_materi_detail
            ->where([
                ['users_id', '=', Auth::guard('api')->user()->id],
                ['kategori_materi_id', '=', $category_id],
            ])->update([
                'exam1' => static::CONSTANT_EXAM1_STATUS, //uts nya lulus
                'status' => static::CONSTANT_STATUS_UNLOCK_EXAM2, // langsung membuka ujian untuk tahap uas
            ]);
    }

    private function HandleUpdateExamAndStatusAfterSubmitExamIfPassedPhase2($category_id)
    {
        return $this->category_materi_detail
            ->where([
                ['users_id', '=', Auth::guard('api')->user()->id],
                ['kategori_materi_id', '=', $category_id],
            ])->update([
                'exam2' => static::CONSTANT_EXAM2_STATUS, // uas nya lulus
            ]);
    }
}
