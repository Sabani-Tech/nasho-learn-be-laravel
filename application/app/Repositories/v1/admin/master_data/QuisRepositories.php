<?php

namespace App\Repositories\v1\admin\master_data;

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Model;

//model
class QuisModel extends Model
{
    protected $table = 'quis';
    protected $casts = [
        'option' => 'array',
        'id' => 'string',
    ];

    protected $fillable = ['title', 'question', 'point', 'option', 'kategori_materi_id', 'materi_id', 'created_at', 'updated_at'];
}

//repositories
class QuisRepositories extends Controller
{
    private $model,
        $category, $materi,
        $start_transaction,
        $commit_transaction,
        $rollback_transaction;
    public function __construct()
    {
        $this->model = new QuisModel();
        $this->start_transaction = DB::beginTransaction();
        $this->commit_transaction = DB::commit();
        $this->category = DB::table('kategori_materi');
        $this->materi = DB::table('materi');
        $this->rollback_transaction = DB::commit();
    }
    public function index($request)
    {
        $limit = 10;
        if ($limit >= $request->limit) {
            $limit = $request->limit;
        }

        return $this->model
            ->when($request->title, function ($query) use ($request) {
                $query->where('title', 'like', "%{$request->title}%");
            })
            ->when($request->question, function ($query) use ($request) {
                $query->where('question', 'like', "%{$request->question}%");
            })
            ->when($request->point, function ($query) use ($request) {
                $query->where('point', 'like', "%{$request->point}%");
            })
            ->when($request->id, function ($query) use ($request) {
                $query->where('id', $request->id);
            })
            ->orderBy('id', $request->typeSort ?? 'asc')
            ->paginate($limit ?? 10);
    }

    public function show($id_quis)
    {
        if (!$this->validate_exists_quis_by_id_childs($id_quis)) {
            return $this->error_response('quis tidak ditemukan');
        }

        if ($this->validate_exists_quis_by_id_childs($id_quis)) {
            return $this->success_response($this->where_exists_quis_by_id_childs($id_quis), 'Berhasil detail quis');
        }
    }

    public function store($quis)
    {
        try {
            $this->start_transaction;
            $quis['created_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            $quis['updated_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            if (!$this->validate_category_by_id($quis)) {
                return $this->error_response('Category not found');
            }
            if (!$this->validate_materi_by_id($quis)) {
                return $this->error_response('Materi not found');
            }

            $this->model->insert($quis);
            $this->commit_transaction;
            return $this->success_response($quis, 'Berhasil tambah quis');
        } catch (\Exception $e) {
            $this->rollback_transaction;
            return $this->error_response($e->getMessage(), '500', true, 'Hint: cek request or something any method store', \env('APP_ENV'));
        }
    }

    public function update($quis, $id_quis)
    {
        try {
            $this->start_transaction;
            $quis['created_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            $quis['updated_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));

            $update_quis = $this->validate_exists_quis_by_id_childs($id_quis);
            if (!$update_quis) {
                return $this->error_response('id quis salah');
            }

            if (!$this->validate_category_by_id($quis)) {
                return $this->error_response('Category not found');
            }
            if (!$this->validate_materi_by_id($quis)) {
                return $this->error_response('Materi not found');
            }

            if ($update_quis) {
                $this->model->where('id', $id_quis)->update($quis);
                $this->commit_transaction;
                return $this->success_response($quis, 'Berhasil update quis');
            }
        } catch (\Exception $e) {
            $this->rollback_transaction;
            return $this->error_response($e->getMessage(), '500', true, \env('APP_ENV'));
        }
    }

    public function delete($soal_id)
    {
        try {
            $this->start_transaction;

            $delete_quis = $this->validate_exists_quis_by_id_childs($soal_id);
            if (!$delete_quis) {
                return $this->error_response('quis sudah di hapus');
            }

            if ($delete_quis) {
                $this->delete_quis_by_id_childs($soal_id);
                $this->commit_transaction;
                return $this->success_response($this->where_exists_quis_by_id_childs($soal_id), 'Berhasil delete quis');
            }
        } catch (\Exception $e) {
            $this->rollback_transaction;
            return $this->error_response($e->getMessage(), '500', true, \env('APP_ENV'));
        }
    }

    private function delete_quis_by_id_childs($soal_id)
    {
        return $this->model->where('id', $soal_id)->delete();
    }

    private function where_exists_quis_by_id_childs($soal_id)
    {
        return $this->model->find($soal_id);
    }

    private function validate_exists_quis_by_id_childs($soal_id): bool
    {
        if ($this->where_exists_quis_by_id_childs($soal_id)) {
            return true;
        }
        return false;
    }

    private function validate_category_by_id(array $quis): bool
    {
        if (!$this->category->find($quis['kategori_materi_id'])) {
            return false;
        }
        return true;
    }
    private function validate_materi_by_id(array $quis): bool
    {
        if (!$this->materi->find($quis['materi_id'])) {
            return false;
        }
        return true;
    }
}
