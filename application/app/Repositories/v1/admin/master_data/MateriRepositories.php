<?php

namespace App\Repositories\v1\admin\master_data;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class MateriRepositories extends Controller
{
    private $model, $start_transaction, $commit_transaction, $rollback_transaction;
    public function __construct()
    {
        $this->model = DB::table('materi');
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
            ->when($request->judul, function ($query) use ($request) {
                $query->where('judul', 'like', "%{$request->judul}%");
            })
            ->when($request->phase, function ($query) use ($request) {
                $query->where('phase', $request->phase);
            })
            ->when($request->id, function ($query) use ($request) {
                $query->where('id', $request->id);
            })
            ->orderBy('id', $request->typeSort ?? 'asc')
            ->paginate($limit ?? 10);
    }

    public function show($uid_materi)
    {
        if (!$this->validate_exists_materi_by_id_childs($uid_materi)) {
            return $this->error_response('materi tidak ditemukan');
        }

        if ($this->validate_exists_materi_by_id_childs($uid_materi)) {
            return $this->success_response($this->where_exists_materi_by_id_childs($uid_materi), 'Berhasil detail materi');
        }
    }

    public function store($materi)
    {
        try {
            $this->start_transaction;
            $materi['created_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            $materi['updated_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            $this->model->insert($materi);
            $this->commit_transaction;
            return $this->success_response($materi, 'Berhasil tambah materi');
        } catch (\Exception $e) {
            $this->rollback_transaction;
            return $this->error_response($e->getMessage(), '500', $e, \env('APP_ENV'));
        }
    }

    public function update($materi, $uid_materi)
    {
        try {
            $this->start_transaction;
            $materi['created_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            $materi['updated_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));

            $update_materi = $this->validate_exists_materi_by_id_childs($uid_materi);
            if (!$update_materi) {
                return $this->error_response('id materi salah');
            }

            if ($update_materi) {
                $this->model->where('id', $uid_materi)->update($materi);
                $this->commit_transaction;
                return $this->success_response($materi, 'Berhasil update materi');
            }
        } catch (\Exception $e) {
            $this->rollback_transaction;
            return $this->error_response($e->getMessage(), '500', $e, \env('APP_ENV'));
        }
    }

    public function delete($uid_materi)
    {
        try {
            $this->start_transaction;

            $delete_materi = $this->validate_exists_materi_by_id_childs($uid_materi);
            if (!$delete_materi) {
                return $this->error_response('materi sudah di hapus');
            }

            if ($delete_materi) {
                $this->delete_materi_by_id_childs($uid_materi);
                $this->commit_transaction;
                return $this->success_response($this->where_exists_materi_by_id_childs($uid_materi), 'Berhasil delete materi');
            }
        } catch (\Exception $e) {
            $this->rollback_transaction;
            return $this->error_response($e->getMessage(), '500', $e, \env('APP_ENV'));
        }
    }

    private function delete_materi_by_id_childs($uid_materi)
    {
        return $this->model->where('id', $uid_materi)->delete();
    }

    private function where_exists_materi_by_id_childs($uid_materi)
    {
        return $this->model->find($uid_materi);
    }

    private function validate_exists_materi_by_id_childs($uid_materi): bool
    {
        if ($this->where_exists_materi_by_id_childs($uid_materi)) {
            return true;
        }
        return false;
    }
}