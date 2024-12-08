<?php

namespace App\Repositories\v1\admin\master_data;

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Model;

//model
class SoalModel extends Model
{
    protected $table = 'soal';
    protected $casts = [
        'option' => 'array'
    ];

    protected $fillable = ['title', 'question', 'point', 'option'];
}

//repositories
class SoalRepositories extends Controller
{
    private $model, $start_transaction, $commit_transaction, $rollback_transaction;
    public function __construct()
    {
        $this->model = new SoalModel();
        $this->start_transaction = DB::beginTransaction();
        $this->commit_transaction = DB::commit();
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

    public function show($id_user)
    {
        if (!$this->validate_exists_soal_by_id_childs($id_user)) {
            return $this->error_response('soal tidak ditemukan');
        }

        if ($this->validate_exists_soal_by_id_childs($id_user)) {
            return $this->success_response($this->where_exists_soal_by_id_childs($id_user), 'Berhasil detail soal');
        }
    }

    public function store($soal)
    {
        try {
            $this->start_transaction;
            $soal['created_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            $soal['updated_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            $this->model->insert($soal);
            $this->commit_transaction;
            return $this->success_response($soal, 'Berhasil tambah soal');
        } catch (\Exception $e) {
            $this->rollback_transaction;
            return $this->error_response($e->getMessage(), '500', true, 'Hint: cek request or something any method store', \env('APP_ENV'));
        }
    }

    public function update($soal, $id_user)
    {
        try {
            $this->start_transaction;
            $soal['created_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            $soal['updated_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));

            $update_user = $this->validate_exists_soal_by_id_childs($id_user);
            if (!$update_user) {
                return $this->error_response('id soal salah');
            }

            if ($update_user) {
                $this->model->where('id', $id_user)->update($soal);
                $this->commit_transaction;
                return $this->success_response($soal, 'Berhasil update soal');
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

            $delete_soal = $this->validate_exists_soal_by_id_childs($soal_id);
            if (!$delete_soal) {
                return $this->error_response('soal sudah di hapus');
            }

            if ($delete_soal) {
                $this->delete_user_by_id_childs($soal_id);
                $this->commit_transaction;
                return $this->success_response($this->where_exists_soal_by_id_childs($soal_id), 'Berhasil delete soal');
            }
        } catch (\Exception $e) {
            $this->rollback_transaction;
            return $this->error_response($e->getMessage(), '500', true, \env('APP_ENV'));
        }
    }

    private function delete_user_by_id_childs($soal_id)
    {
        return $this->model->where('id', $soal_id)->delete();
    }

    private function where_exists_soal_by_id_childs($soal_id)
    {
        return $this->model->find($soal_id);
    }

    private function validate_exists_soal_by_id_childs($soal_id): bool
    {
        if ($this->where_exists_soal_by_id_childs($soal_id)) {
            return true;
        }
        return false;
    }
}
