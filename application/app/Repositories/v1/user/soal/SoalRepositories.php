<?php

namespace App\Repositories\v1\user\soal;

use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

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
    protected $hidden = ['kategori_materi_id', 'materi_id', 'phase'];
}

//Model submit(Quis and Exam)
class QuisAnswerModel extends Model
{
    protected $table = 'quis_answer';
    protected $fillable = ['id', 'point', 'batch', 'answer', 'quis_id', 'users_id', 'created_at', 'updated_at'];
}

class SoalRepositories extends Controller
{
    private $quis_model, $ujian_model, $quis_answer_model;
    public function __construct()
    {
        $this->quis_model = new QuisModel();
        $this->ujian_model = new UjianModel();
        $this->quis_answer_model = new QuisAnswerModel();
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
            ['phase', '=', $request->query('phase')],
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
        if (!$this->HandleValidateQuisCategoryById($category_id)) {
            return $this->error_response('Category Not Found');
        }
        if (!$this->HandleValidateQuisMateriById($materi_id)) {
            return $this->error_response('Materi Not Found');
        }

        $PrintQuis = $this->_GetRequestQuisSubmit($REQUEST_POST, $category_id, $materi_id);
        return $this->success_response($PrintQuis);
    }

    private function _SetRequestQuisSubmit($REQUEST_POST, $category_id, $materi_id): void
    {
        $CollectAnswer = [];
        foreach ($REQUEST_POST as $quis) {
            $quis['point'] = $this->quis_model->where([
                ['kategori_materi_id', '=', $category_id],
                ['materi_id', '=', $materi_id],
                ['id', '=', $quis['quis_id']]
            ])->first()->answer_key == $quis['answer']['key'] ? 20 : 0; //mencocokan jawaban user dengan kunci jawaban dari soal: jika benar maka point full:20 akan tetapi jika salah point 0
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
        $this->_SetRequestQuisSubmit($REQUEST_POST, $category_id, $materi_id);

        //return mapping quis
        return $this->HandleMappingSubmitQuis($category_id, $materi_id);
    }

    private function HandleMappingSubmitQuis($category_id, $materi_id): array
    {
        return array(
            'passed' => $this->quis_answer_model->where([
                ['kategori_materi_id', '=', $category_id],
                ['materi_id', '=', $materi_id],
            ])->sum('point') <= 100 ? false : true,
            'correct_count' => $this->quis_answer_model->where([
                ['kategori_materi_id', '=', $category_id],
                ['materi_id', '=', $materi_id],
                ['point', '=', 20]
            ])->get()->count(),
            'incorrect_count' => $this->quis_answer_model->where([
                ['kategori_materi_id', '=', $category_id],
                ['materi_id', '=', $materi_id],
                ['point', '=', 0]
            ])->get()->count(),
            'score' => $this->quis_answer_model->where([
                ['kategori_materi_id', '=', $category_id],
                ['materi_id', '=', $materi_id],
            ])->sum('point'),
            'total_score' => 100,
            'title' => DB::table('materi')->whereId($materi_id)->first()->judul,
        );
    }

    //exam

    public function ExamSubmit($category_id, $request) {}
}
