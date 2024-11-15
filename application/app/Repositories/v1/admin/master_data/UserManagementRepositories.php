<?php

namespace App\Repositories\v1\admin\master_data;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class UserManagementRepositories extends Controller
{
    private $model, $start_transaction, $commit_transaction, $rollback_transaction;
    public function __construct()
    {
        $this->model = DB::table('users');
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
            ->when($request->nama_lengkap, function ($query) use ($request) {
                $query->where('nama_lengkap', 'like', "%{$request->nama_lengkap}%");
            })
            ->when($request->email, function ($query) use ($request) {
                $query->where('email', 'like', "%{$request->email}%");
            })
            ->when($request->username, function ($query) use ($request) {
                $query->where('username', 'like', "%{$request->username}%");
            })
            ->when($request->id, function ($query) use ($request) {
                $query->where('id', $request->id);
            })
            ->orderBy('id', $request->typeSort ?? 'asc')
            ->paginate($limit ?? 10);
    }

    public function show($id_user)
    {
        if (!$this->validate_exists_user_by_id_childs($id_user)) {
            return $this->error_response('user tidak ditemukan');
        }

        if ($this->validate_exists_user_by_id_childs($id_user)) {
            return $this->success_response($this->where_exists_user_by_id_childs($id_user), 'Berhasil detail user');
        }
    }

    public function store($user)
    {
        try {
            $this->start_transaction;
            $user['created_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            $user['updated_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            $this->model->insert($user);
            $this->commit_transaction;
            return $this->success_response($user, 'Berhasil tambah user');
        } catch (\Exception $e) {
            $this->rollback_transaction;
            return $this->error_response($e->getMessage(), '500', $e, \env('APP_ENV'));
        }
    }

    public function update($user, $id_user)
    {
        try {
            $this->start_transaction;
            $user['created_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            $user['updated_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));

            $update_user = $this->validate_exists_user_by_id_childs($id_user);
            if (!$update_user) {
                return $this->error_response('id user salah');
            }

            if ($update_user) {
                $this->model->where('id', $id_user)->update($user);
                $this->commit_transaction;
                return $this->success_response($user, 'Berhasil update user');
            }
        } catch (\Exception $e) {
            $this->rollback_transaction;
            return $this->error_response($e->getMessage(), '500', $e, \env('APP_ENV'));
        }
    }

    public function delete($id_user)
    {
        try {
            $this->start_transaction;

            $delete_user = $this->validate_exists_user_by_id_childs($id_user);
            if (!$delete_user) {
                return $this->error_response('user sudah di hapus');
            }

            if ($delete_user) {
                $this->delete_user_by_id_childs($id_user);
                $this->commit_transaction;
                return $this->success_response($this->where_exists_user_by_id_childs($id_user), 'Berhasil delete user');
            }
        } catch (\Exception $e) {
            $this->rollback_transaction;
            return $this->error_response($e->getMessage(), '500', $e, \env('APP_ENV'));
        }
    }

    private function delete_user_by_id_childs($id_user)
    {
        return $this->model->where('id', $id_user)->delete();
    }

    private function where_exists_user_by_id_childs($id_user)
    {
        return $this->model->find($id_user);
    }

    private function validate_exists_user_by_id_childs($id_user): bool
    {
        if ($this->where_exists_user_by_id_childs($id_user)) {
            return true;
        }
        return false;
    }
}
