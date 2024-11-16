<?php

namespace App\Repositories\v1\user\category;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class CategoryRepositories extends Controller
{
    private $category, $materi;
    public function __construct()
    {
        $this->category = DB::table('kategori_materi');
        $this->materi = DB::table('materi');
    }

    public function ListCategory()
    {
        return $this->category->get();
    }

    public function ListMateriByCategory($kategori_id)
    {
        $validate_category_id_for_materi = $this->handle_validate_category_id_for_materi($kategori_id);
        if (!$validate_category_id_for_materi) {
            return $this->error_response('Category not found', 422);
        }

        if ($validate_category_id_for_materi) {
            return $this->success_response($this->materi->where('kategori_materi_id', $kategori_id)->get(), 'Successfully Get Materi By Category');
        }
    }

    private function handle_validate_category_id_for_materi($kategori_id): bool
    {
        if ($this->category->find($kategori_id)) {
            return true;
        }
        return false;
    }
}
