<?php

namespace App\Repositories\v1\user\category;

use App\Http\Controllers\Controller;
use App\Http\Resources\MateriResource;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

enum Status: string
{
    case status1 = 'Materi1';
    case status2 = 'Exam1';
    case status3 = 'Materi2';
    case status4 = 'Exam2';
}
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

    //relation list nya kategori_materi.id -> materi.kategori_materi_id (untuk mengambil list materi berdasarkan dari kategori)
    public function materi(): HasMany
    {
        return $this->hasMany(Materi::class, 'kategori_materi_id');
    }
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
        return MateriResource::collection($this->category->get());
    }

    public function ListMateriByCategory($kategori_id)
    {
        $validate_category_id_for_materi = $this->handle_validate_category_id_for_materi($kategori_id);
        if (!$validate_category_id_for_materi) {
            return $this->error_response('Category not found', 422);
        }

        if ($validate_category_id_for_materi) {
            // return $this->success_response($this->materi->where('kategori_materi_id', $kategori_id)->with('kategori')->get(), 'Successfully Get Materi By Category');
            $category = $this->category->whereId($kategori_id)->firstOrFail();
            return $this->handle_materi_by_id_category($category);
        }
    }

    private function handle_materi_by_id_category($category)
    {
        $category['jenis_arab'] = $category['jenis'] == 'nahwu' ? 'نحوو' : 'صرف';
        $category['materi_phase1'] = $this->materi->where([['kategori_materi_id', '=', $category->id], ['phase', '=', 1]])->get();
        $category['materi_phase2'] = $this->materi->where([['kategori_materi_id', '=', $category->id], ['phase', '=', 2]])->get();
        $category['status'] = Status::status1;
        return $this->success_response($category, 'SUCCESS');
    }

    private function handle_validate_category_id_for_materi($kategori_id): bool
    {
        if ($this->category->find($kategori_id)) {
            return true;
        }
        return false;
    }
}
