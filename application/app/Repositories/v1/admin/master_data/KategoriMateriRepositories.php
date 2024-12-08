<?php

namespace App\Repositories\v1\admin\master_data;

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class KategoriMateriRepositories extends Controller
{
    private $model, $start_transaction, $commit_transaction, $rollback_transaction;
    public function __construct()
    {
        $this->model = DB::table('kategori_materi');
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
            ->when($request->jenis, function ($query) use ($request) {
                $query->where('jenis', 'like', "%{$request->jenis}%");
            })
            ->when($request->deskripsi, function ($query) use ($request) {
                $query->where('deskripsi', 'like', "%{$request->deskripsi}%");
            })
            ->when($request->id, function ($query) use ($request) {
                $query->where('id', $request->id);
            })
            ->orderBy('id', $request->typeSort ?? 'asc')
            ->paginate($limit ?? 10);
    }

    public function show($uid_kategori_materi)
    {
        if (!$this->validate_exists_kategori_materi_by_id_childs($uid_kategori_materi)) {
            return $this->error_response('kategori materi tidak ditemukan');
        }

        if ($this->validate_exists_kategori_materi_by_id_childs($uid_kategori_materi)) {
            return $this->success_response($this->where_exists_kategori_materi_by_id_childs($uid_kategori_materi), 'Berhasil kategori detail materi');
        }
    }

    public function store($kategori_materi)
    {
        try {
            $this->start_transaction;
            $kategori_materi['created_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            $kategori_materi['updated_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            $this->model->insert($kategori_materi);
            $this->commit_transaction;
            return $this->success_response($kategori_materi, 'Berhasil tambah kategori materi');
        } catch (\Exception $e) {
            $this->rollback_transaction;
            return $this->error_response($e->getMessage(), '500', true, $e, \env('APP_ENV'));
        }
    }

    public function update($kategori_materi, $uid_kategori_materi)
    {
        try {
            $this->start_transaction;
            $kategori_materi['created_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            $kategori_materi['updated_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));

            $update_kategori_materi = $this->validate_exists_kategori_materi_by_id_childs($uid_kategori_materi);
            if (!$update_kategori_materi) {
                return $this->error_response('id kategori materi salah');
            }

            if ($update_kategori_materi) {
                $this->model->where('id', $uid_kategori_materi)->update($kategori_materi);
                $this->commit_transaction;
                return $this->success_response($kategori_materi, 'Berhasil update kategori materi');
            }
        } catch (\Exception $e) {
            $this->rollback_transaction;
            return $this->error_response($e->getMessage(), '500', true, $e, \env('APP_ENV'));
        }
    }

    public function delete($uid_materi)
    {
        try {
            $this->start_transaction;

            $delete_kategori_materi = $this->validate_exists_kategori_materi_by_id_childs($uid_materi);
            if (!$delete_kategori_materi) {
                return $this->error_response('kateogri materi sudah di hapus');
            }

            if ($delete_kategori_materi) {
                $this->delete_kategori_materi_by_id_childs($uid_materi);
                $this->commit_transaction;
                return $this->success_response($this->where_exists_kategori_materi_by_id_childs($uid_materi), 'Berhasil delete kategori materi');
            }
        } catch (\Exception $e) {
            $this->rollback_transaction;
            return $this->error_response($e->getMessage(), '500', true, $e, \env('APP_ENV'));
        }
    }

    private function delete_kategori_materi_by_id_childs($uid_materi)
    {
        return $this->model->where('id', $uid_materi)->delete();
    }

    private function where_exists_kategori_materi_by_id_childs($uid_materi)
    {
        return $this->model->find($uid_materi);
    }

    private function validate_exists_kategori_materi_by_id_childs($uid_materi): bool
    {
        if ($this->where_exists_kategori_materi_by_id_childs($uid_materi)) {
            return true;
        }
        return false;
    }
}
