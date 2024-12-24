<?php

namespace App\Repositories\v1\admin\master_data;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class AboutRepositories extends Controller
{
    private $model, $start_transaction, $commit_transaction, $rollback_transaction;
    public function __construct()
    {
        $this->model = DB::table('about');
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
                $query->where('content', 'like', "%{$request->judul}%");
            })
            ->when($request->id, function ($query) use ($request) {
                $query->where('id', $request->id);
            })
            ->orderBy('id', $request->typeSort ?? 'asc')
            ->paginate($limit ?? 10);
    }

    public function show($id_about)
    {
        if (!$this->validate_exists_about_by_id_childs($id_about)) {
            return $this->error_response('about tidak ditemukan');
        }

        if ($this->validate_exists_about_by_id_childs($id_about)) {
            return $this->success_response($this->where_exists_about_by_id_childs($id_about), 'Berhasil detail about');
        }
    }

    public function store($about)
    {
        try {
            $this->start_transaction;
            $about['created_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            $about['updated_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            $this->model->insert($about);
            $this->commit_transaction;
            return $this->success_response($about, 'Berhasil tambah about');
        } catch (\Exception $e) {
            $this->rollback_transaction;
            return $this->error_response($e->getMessage(), '500', true, $e, \env('APP_ENV'));
        }
    }

    public function update($about, $id_about)
    {
        try {
            $this->start_transaction;
            $about['created_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            $about['updated_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));

            $update_about = $this->validate_exists_about_by_id_childs($id_about);
            if (!$update_about) {
                return $this->error_response('id about salah');
            }

            if ($update_about) {
                $this->model->where('id', $id_about)->update($about);
                $this->commit_transaction;
                return $this->success_response($about, 'Berhasil update about');
            }
        } catch (\Exception $e) {
            $this->rollback_transaction;
            return $this->error_response($e->getMessage(), '500', true, $e, \env('APP_ENV'));
        }
    }

    public function delete($id_about)
    {
        try {
            $this->start_transaction;

            $delete_about = $this->validate_exists_about_by_id_childs($id_about);
            if (!$delete_about) {
                return $this->error_response('about sudah di hapus');
            }

            if ($delete_about) {
                $this->delete_about_by_id_childs($id_about);
                $this->commit_transaction;
                return $this->success_response($this->where_exists_about_by_id_childs($id_about), 'Berhasil delete about');
            }
        } catch (\Exception $e) {
            $this->rollback_transaction;
            return $this->error_response($e->getMessage(), '500', true, $e, \env('APP_ENV'));
        }
    }

    private function delete_about_by_id_childs($id_about)
    {
        return $this->model->where('id', $id_about)->delete();
    }

    private function where_exists_about_by_id_childs($id_about)
    {
        return $this->model->find($id_about);
    }

    private function validate_exists_about_by_id_childs($id_about): bool
    {
        if ($this->where_exists_about_by_id_childs($id_about)) {
            return true;
        }
        return false;
    }
}
