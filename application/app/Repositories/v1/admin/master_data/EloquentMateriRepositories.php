<?php

namespace App\Repositories\v1\admin\master_data;

use Carbon\Carbon;
use App\Models\Materi;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Request;

//repositories
class EloquentMateriRepositories implements MateriRepositories
{
    private
        $materi_model,
        $materi_query_builder,
        $category_materi_query_builder,
        $start_transaction,
        $commit_transaction,
        $rollback_transaction;
    public function __construct()
    {
        $this->materi_model = new Materi();
        $this->materi_query_builder = DB::table('materi');
        $this->category_materi_query_builder = DB::table('kategori_materi');
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

        return $this->materi_model
            ->with('kategori')
            ->when($request->judul, function ($query) use ($request) {
                $query->where('judul', 'like', "%{$request->judul}%");
            })
            ->when($request->embed, function ($query) use ($request) {
                $query->where('embed', $request->embed);
            })
            ->when($request->id, function ($query) use ($request) {
                $query->where('id', $request->id);
            })
            ->orderBy('permalink', $request->typeSort ?? 'asc')
            ->paginate($limit ?? 10);
    }

    public function show($permalink_materi, $response)
    {
        if (!$this->validate_exists_materi_by_permalink_childs($permalink_materi)) {
            return $response->error_response('materi tidak ditemukan');
        }

        if ($this->validate_exists_materi_by_permalink_childs($permalink_materi)) {
            return $response->success_response($this->where_exists_materi_by_permalink_childs($permalink_materi), 'Berhasil detail materi');
        }
    }

    public function store($materi, $response)
    {
        try {
            $this->start_transaction;
            $materi['created_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            $materi['updated_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            $materi['permalink'] = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $materi['judul'])));
            if (!$this->validate_category_materi_by_id($materi)) {
                return $response->error_response('Category not found', 422);
            }
            $nama_file = $this->handle_create_or_update_file_materi();
            $materi['file_uri'] = $nama_file;

            $this->materi_query_builder->insert($materi);
            $this->commit_transaction;
            return $response->success_response($materi, 'Berhasil tambah materi');
        } catch (\Exception $e) {
            $this->rollback_transaction;
            return $response->error_response($e->getMessage(), '500', true, $e, \env('APP_ENV'));
        }
    }

    public function update($materi, $permalink_materi, $response)
    {
        try {
            $this->start_transaction;
            $materi['created_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            $materi['updated_at'] = Carbon::now()->timezone(\env('APP_TIMEZONE'));
            $materi['permalink'] = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $materi['judul'])));
            if (!$this->validate_category_materi_by_id($materi)) {
                return $response->error_response('Category not found', 422);
            }

            $update_materi = $this->validate_exists_materi_by_permalink_childs($permalink_materi);
            if (!$update_materi) {
                return $response->error_response('id materi salah');
            }

            if ($update_materi) {
                $nama_file = $this->handle_create_or_update_file_materi();
                $materi['file_uri'] = $nama_file;
                $this->materi_query_builder->where('permalink', $permalink_materi)->update($materi);
                $this->commit_transaction;
                return $response->success_response($materi, 'Berhasil update materi');
            }
        } catch (\Exception $e) {
            $this->rollback_transaction;
            return $response->error_response($e->getMessage(), '500', true, $e, \env('APP_ENV'));
        }
    }

    public function delete($permalink_materi, $response)
    {
        try {
            $this->start_transaction;

            $delete_materi = $this->validate_exists_materi_by_permalink_childs($permalink_materi);
            if (!$delete_materi) {
                return $response->error_response('materi sudah di hapus');
            }

            if ($delete_materi) {
                $file_path = public_path("assets/{$this->where_exists_materi_by_permalink_childs($permalink_materi)->file_uri}");
                File::delete($file_path);
                $this->delete_materi_by_id_childs($permalink_materi);
                $this->commit_transaction;
                return $response->success_response($this->where_exists_materi_by_permalink_childs($permalink_materi), 'Berhasil delete materi');
            }
        } catch (\Exception $e) {
            $this->rollback_transaction;
            return $response->error_response($e->getMessage(), '500', true, $e, \env('APP_ENV'));
        }
    }
    private function handle_create_or_update_file_materi()
    {
        $file = Request::file('file_uri');
        $nama_file = time() . "-" . $file->getClientOriginalName();

        $destination_file_upload = 'assets';
        $file->move($destination_file_upload, $nama_file);
        return $nama_file;
    }

    private function delete_materi_by_id_childs($permalink_materi)
    {
        return $this->materi_query_builder->where('permalink', $permalink_materi)->delete();
    }

    private function where_exists_materi_by_permalink_childs($permalink_materi)
    {
        return $this->materi_query_builder->wherepermalink($permalink_materi)->first();
    }

    private function where_exists_category_materi_by_id($kategori)
    {
        return $this->category_materi_query_builder->find($kategori['kategori_materi_id']);
    }

    // handler validate materi by permalink
    private function validate_exists_materi_by_permalink_childs($permalink_materi): bool
    {
        if ($this->where_exists_materi_by_permalink_childs($permalink_materi)) {
            return true;
        }
        return false;
    }

    // handler validate category materi by ID
    private function validate_category_materi_by_id($kategori): bool
    {
        if (!$this->where_exists_category_materi_by_id($kategori)) {
            return false;
        }
        return true;
    }
}
