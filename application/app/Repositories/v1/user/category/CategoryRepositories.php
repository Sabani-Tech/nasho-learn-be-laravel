<?php

namespace App\Repositories\v1\user\category;

use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Support\Facades\DB;

//model
class Materi extends Model
{
    protected $table = 'materi';
    protected $fillable = ['embed', 'judul', 'permalink', 'isi', 'kategori_materi_id', 'created_at', 'updated_at'];

    protected $casts = ['id' => 'string', 'created_at' => 'date:d-M-y H:i:s', 'updated_at' => 'date:d-M-y H:i:s'];
    protected $hidden = ['kategori_materi_id'];

    public function kategori(): HasOne
    {
        return $this->hasOne(Category::class, 'id', 'kategori_materi_id');
    }
}

class Category extends Model
{
    protected $table = 'kategori_materi';
    protected $fillable = ['jenis', 'deskripsi', 'created_at', 'updated_at'];

    protected $casts = ['id' => 'string', 'created_at' => 'date:d-M-y H:i:s', 'updated_at' => 'date:d-M-y H:i:s'];
}

//repositories
class CategoryRepositories extends Controller
{
    private $category, $materi;
    public function __construct()
    {
        $this->category = new Category();
        $this->materi = new Materi();
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
            return $this->success_response($this->materi->where('kategori_materi_id', $kategori_id)->with('kategori')->get(), 'Successfully Get Materi By Category');
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
