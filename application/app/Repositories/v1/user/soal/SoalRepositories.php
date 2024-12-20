<?php

namespace App\Repositories\v1\user\soal;

use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Http\Resources\PembahasanExamResource;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\Model;
use App\Http\Resources\PembahasanQuisResource;

//Model query(quis and exam)
class QuisModel extends Model
{
    protected $table = 'quis';
    protected $casts = [
        'option' => 'array',
        'id' => 'string',
    ];
    protected $hidden = ['kategori_materi_id', 'materi_id'];
}
class UjianModel extends Model
{
    protected $table = 'exam';
    protected $casts = [
        'option' => 'array',
        'id' => 'string',
    ];
    protected $hidden = [
        'kategori_materi_id',
        'materi_id',
        'phase'
    ];
}

//Model submit(Quis and Exam)
class QuisAnswerModel extends Model
{
    protected $table = 'quis_answer';
    protected $fillable = [
        'id',
        'point',
        'batch',
        'answer',
        'quis_id',
        'users_id',
        'created_at',
        'updated_at'
    ];
    protected $casts = [
        'id' => 'string'
    ];
}

class ExamAnswerModel extends Model
{
    protected $table = 'exam_answer';
    protected $fillable = [
        'point',
        'batch',
        'answer',
        'exam_id',
        'kategori_materi_id',
        'phase',
        'users_id',
        'created_at',
        'updated_at',
    ];
    protected $casts = [
        'id' => 'string',
    ];
}

class SoalRepositories extends Controller
{
    private $quis_model, $ujian_model, $quis_answer_model, $exam_answer_model;
    public function __construct()
    {
        $this->quis_model = new QuisModel();
        $this->ujian_model = new UjianModel();
        $this->quis_answer_model = new QuisAnswerModel();
        $this->exam_answer_model = new ExamAnswerModel();
    }
    public function Quis($category_id, $materi_id)
    {
        if (!$this->HandleValidateQuisCategoryById($category_id)) {
            return $this->error_response('Category Not Found');
        }
        if (!$this->HandleValidateQuisMateriById($materi_id)) {
            return $this->error_response('Materi Not Found');
        }

        return $this->success_response($this->HandleGetQuisByCategoryIdAndMateriId($this->quis_model, $category_id, $materi_id));
    }

    public function Exam($category_id, $request)
    {
        if (!$this->HandleValidateUjianCategoryById($category_id)) {
            return $this->error_response('Category Not Found');
        }

        return $this->success_response($this->HandleGetUjianByCategoryId($this->ujian_model, $category_id, $request));
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
    public function QuisSubmit($category_id, $materi_id, $REQUEST_POST)
    {
        DB::beginTransaction();
        try {
            if (!$this->HandleValidateQuisCategoryById($category_id)) {
                return $this->error_response('Category Not Found');
            }
            if (!$this->HandleValidateQuisMateriById($materi_id)) {
                return $this->error_response('Materi Not Found');
            }

            $PrintQuis = $this->_GetRequestQuisSubmit($REQUEST_POST, $category_id, $materi_id);
            DB::commit();
            return $this->success_response($PrintQuis);
        } catch (\Exception $e) {
            DB::rollBack();
            return $this->error_response($e);
        }
    }

    private function _SetRequestQuisSubmit($REQUEST_POST, $category_id, $materi_id): void
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
        $this->quis_answer_model->insert($CollectAnswer);
    }

    private function _GetRequestQuisSubmit($REQUEST_POST, $category_id, $materi_id)
    {
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
        $this->_SetRequestQuisSubmit($REQUEST_POST, $category_id, $materi_id);
        //update quis_status materi: kalo udah pernah ikut quis ubah value quis_status jadi true base on id materi
        $this->HandleUpdateQuisStatusAfterSubmitQuisByIdMateri($materi_id);
        //return mapping quis
        return $this->HandleMappingSubmitQuis($category_id, $materi_id);
    }

    private function HandleMappingSubmitQuis($category_id, $materi_id): array
    {
        return array(
            'passed' => $this->quis_answer_model->where([
                ['kategori_materi_id', '=', $category_id],
                ['materi_id', '=', $materi_id],
                ['users_id', '=', Auth::guard('api')->user()->id],
            ])->sum('point') < 100 ? false : true,
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
            'title' => DB::table('materi')
                ->whereId($materi_id)
                ->first()
                ->judul,
        );
    }

    private function HandleUpdateQuisStatusAfterSubmitQuisByIdMateri($materi_id)
    {
        return DB::table('materi')
            ->whereId($materi_id)
            ->update(['quis_status' => 'true']);
    }

    public function QuisResult($category_id, $materi_id)
    {
        if (!$this->HandleValidateQuisCategoryById($category_id)) {
            return $this->error_response('Category Not Found');
        }
        if (!$this->HandleValidateQuisMateriById($materi_id)) {
            return $this->error_response('Materi Not Found');
        }

        return $this->success_response(PembahasanQuisResource::collection($this->quis_answer_model->where([
            ['kategori_materi_id', '=', $category_id],
            ['materi_id', '=', $materi_id],
            ['users_id', '=', Auth::guard('api')->user()->id],
        ])->get()));
    }

    //exam

    public function ExamSubmit($category_id, $REQUEST_POST, $REQUEST_GET_PHASE)
    {
        DB::beginTransaction();
        try {
            if (!$this->HandleValidateQuisCategoryById($category_id)) {
                return $this->error_response('Category Not Found');
            }

            $PrintExam = $this->_GetRequestExamSubmit($category_id, $REQUEST_POST, $REQUEST_GET_PHASE);
            DB::commit();
            return $this->success_response($PrintExam);
        } catch (\Exception $e) {
            DB::rollBack();
            return $this->error_response($e->getMessage());
        }
    }

    public function ExamResult($category_id, $REQUEST_GET_PHASE)
    {
        if (!$this->HandleValidateQuisCategoryById($category_id)) {
            return $this->error_response('Category Not Found');
        }

        return $this->success_response(PembahasanExamResource::collection($this->exam_answer_model->where([
            ['kategori_materi_id', '=', $category_id],
            ['phase', '=', $REQUEST_GET_PHASE],
            ['users_id', '=', Auth::guard('api')->user()->id],
        ])->get()));
    }

    private function _SetRequestExamSubmit($category_id, $REQUEST_POST, $REQUEST_GET_PHASE): void
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
        $this->exam_answer_model->insert($CollectAnswer);
    }

    private function _GetRequestExamSubmit($category_id, $REQUEST_POST, $REQUEST_GET_PHASE)
    {
        $RowAnswer = $this->exam_answer_model->where([
            ['kategori_materi_id', '=', $category_id],
            ['phase', '=', $REQUEST_GET_PHASE],
            ['users_id', '=', Auth::guard('api')->user()->id],
        ]);
        if ($RowAnswer) {
            $RowAnswer->delete();
        }

        //submit exam
        $this->_SetRequestExamSubmit($category_id, $REQUEST_POST, $REQUEST_GET_PHASE);
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

        //return mapping exam
        return $this->HandleMappingSubmitExam($category_id, $REQUEST_GET_PHASE);
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
            'title' => DB::table('kategori_materi')
                ->whereId($category_id)
                ->first()
                ->jenis,
        );
    }

    private function HandleUpdateExamAndStatusAfterSubmitExamIfPassedPhase1($category_id)
    {
        return DB::table('kategori_materi_detail')
            ->where([
                ['users_id', '=', Auth::guard('api')->user()->id],
                ['kategori_materi_id', '=', $category_id],
            ])->update([
                'exam1' => 'true', //uts nya lulus
                'status' => 'Exam2', // langsung membuka ujian untuk tahap uas
            ]);
    }

    private function HandleUpdateExamAndStatusAfterSubmitExamIfPassedPhase2($category_id)
    {
        return DB::table('kategori_materi_detail')
            ->where([
                ['users_id', '=', Auth::guard('api')->user()->id],
                ['kategori_materi_id', '=', $category_id],
            ])->update([
                'exam2' => 'true', // uas nya lulus
            ]);
    }
}
