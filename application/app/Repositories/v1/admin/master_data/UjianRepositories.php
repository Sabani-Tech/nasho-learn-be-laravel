<?php

namespace App\Repositories\v1\admin\master_data;

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Model;

//model
class UjianModel extends Model
{
    protected $table = 'exam';
    protected $casts = [
        'option' => 'array',
        'id' => 'string',
    ];

    protected $fillable = ['title', 'question', 'point', 'option', 'kategori_materi_id', 'created_at', 'updated_at'];
}

//repositories
class UjianRepositories extends Controller
{
    private $model, $category,
        $start_transaction,
        $commit_transaction,
        $rollback_transaction;
    public function __construct()
    {
        $this->model = new UjianModel();
        $this->start_transaction = DB::beginTransaction();
        $this->commit_transaction = DB::commit();
        $this->category = DB::table('kategori_materi');
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

    public function show($id_ujian)
    {
        if (!$this->validate_exists_ujian_by_id_childs($id_ujian)) {
            return $this->error_response('ujian tidak ditemukan');
        }

        if ($this->validate_exists_ujian_by_id_childs($id_ujian)) {
            return $this->success_response($this->where_exists_ujian_by_id_childs($id_ujian), 'Berhasil detail ujian');
        }
    }

    public function store($ujian)
    {
        try {
            $this->start_transaction;
            $ujian['created_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            $ujian['updated_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            if (!$this->validate_category_by_id($ujian)) {
                return $this->error_response('Category not found');
            }

            $this->model->insert($ujian);
            $this->commit_transaction;
            return $this->success_response($ujian, 'Berhasil tambah ujian');
        } catch (\Exception $e) {
            $this->rollback_transaction;
            return $this->error_response($e->getMessage(), '500', true, 'Hint: cek request or something any method store', \env('APP_ENV'));
        }
    }

    public function update($ujian, $id_ujian)
    {
        try {
            $this->start_transaction;
            $ujian['created_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            $ujian['updated_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));

            $update_ujian = $this->validate_exists_ujian_by_id_childs($id_ujian);
            if (!$update_ujian) {
                return $this->error_response('id ujian salah');
            }

            if (!$this->validate_category_by_id($ujian)) {
                return $this->error_response('Category not found');
            }

            if ($update_ujian) {
                $this->model->where('id', $id_ujian)->update($ujian);
                $this->commit_transaction;
                return $this->success_response($ujian, 'Berhasil update ujian');
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

            $delete_ujian = $this->validate_exists_ujian_by_id_childs($soal_id);
            if (!$delete_ujian) {
                return $this->error_response('ujian sudah di hapus');
            }

            if ($delete_ujian) {
                $this->delete_ujian_by_id_childs($soal_id);
                $this->commit_transaction;
                return $this->success_response($this->where_exists_ujian_by_id_childs($soal_id), 'Berhasil delete ujian');
            }
        } catch (\Exception $e) {
            $this->rollback_transaction;
            return $this->error_response($e->getMessage(), '500', true, \env('APP_ENV'));
        }
    }

    private function delete_ujian_by_id_childs($soal_id)
    {
        return $this->model->where('id', $soal_id)->delete();
    }

    private function where_exists_ujian_by_id_childs($soal_id)
    {
        return $this->model->find($soal_id);
    }

    private function validate_exists_ujian_by_id_childs($soal_id): bool
    {
        if ($this->where_exists_ujian_by_id_childs($soal_id)) {
            return true;
        }
        return false;
    }

    private function validate_category_by_id(array $ujian): bool
    {
        if (!$this->category->find($ujian['kategori_materi_id'])) {
            return false;
        }
        return true;
    }
}
