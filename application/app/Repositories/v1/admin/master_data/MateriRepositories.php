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

        return $this->model->paginate($limit ?? 10);
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
}
