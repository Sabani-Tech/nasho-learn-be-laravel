<?php

namespace App\Repositories\v1\user\category;

use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Model;
use App\Http\Resources\GetMateriByCategoryResource;
use Illuminate\Support\Facades\Auth;

enum Status: string
{
    case status1 = 'Materi1';
    case status2 = 'Exam1';
    case status3 = 'Materi2';
    case status4 = 'Exam2';
}
class Category extends Model
{
    protected $table = 'kategori_materi';
    protected $fillable = [
        'jenis',
        'deskripsi',
        'created_at',
        'updated_at'
    ];

    protected $casts = [
        'id' => 'string',
        'created_at' => 'date:d-M-y H:i:s',
        'updated_at' => 'date:d-M-y H:i:s'
    ];
}

class Materi extends Model
{
    protected $table = 'materi';
    protected $casts = [
        'id' => 'string',
        'created_at' => 'date:d-M-y H:i:s',
        'updated_at' => 'date:d-M-y H:i:s'
    ];
}

class CategoryMateriDetail extends Model
{
    protected $table = 'kategori_materi_detail';
    protected $casts = [
        'created_at' => 'date:d-M-y H:i:s',
        'updated_at' => 'date:d-M-y H:i:s'
    ];
}

//repositories
class CategoryRepositories extends Controller
{
    private $category, $category_detail, $materi;
    public function __construct()
    {
        $this->category = new Category();
        $this->category_detail = new CategoryMateriDetail();
        $this->materi = new Materi();
    }

    public function ListCategory()
    {
        return GetMateriByCategoryResource::collection($this->category->get());
    }

    public function ListMateriByCategory($kategori_id)
    {
        if (!$this->HandleValidateCategoryById($kategori_id)) {
            return $this->error_response('Category not found', 422);
        }

        //check ID user for field category detail
        if (!$this->HandleValidateFieldCategoryDetailByUserID($kategori_id)) {
            $this->HandleCreateFieldCategoryDetailByUserID($kategori_id);
        }

        $category = $this->HandleGetCategoryById($kategori_id);
        $category_detail = $this->HandleGetCategoryDetailByIdCategory($kategori_id);
        return $this->success_response($this->_GetCustomOfListMateriByCategory($category, $category_detail));
    }

    public function UpdateStatusByCategoryId($category_id, $status_category)
    {
        if (!$this->HandleValidateCategoryById($category_id)) {
            return $this->error_response('Category not found', 422);
        }

        $status = $this->HandleUpdateFieldCategoryDetailByUserID($category_id, $status_category);
        return $this->success_response($status, 'Success Update Status Category');
    }

    private function _SetCustomOfListMateriByCategory($category, $category_detail)
    {
        $category['jenis_arab'] = $this->HandleValidateTypeArabicBaseCategory($category);
        $category['exam1'] = $category_detail->exam1;
        $category['exam2'] = $category_detail->exam2;
        $category['status'] = $category_detail->status;
        $category['materi_phase1'] = $this->HandleGetListMateriByIdCategoryOfMateriPhase1($category);
        $category['materi_phase2'] = $this->HandleGetListMateriByIdCategoryOfMateriPhase2($category);
        return $category;
    }

    private function _GetCustomOfListMateriByCategory($category, $category_detail)
    {
        return $this->_SetCustomOfListMateriByCategory($category, $category_detail);
    }

    private function HandleValidateTypeArabicBaseCategory($category)
    {
        return $category['jenis'] == 'Nahwu' || $category['jenis'] == 'nahwu' ? 'نحوو' : 'صرف';
    }

    private function HandleGetListMateriByIdCategoryOfMateriPhase1($category)
    {
        return $this->materi->where([
            ['kategori_materi_id', '=', $category->id],
            ['phase', '=', 1],
        ])->get();
    }

    private function HandleGetListMateriByIdCategoryOfMateriPhase2($category)
    {
        return $this->materi->where([
            ['kategori_materi_id', '=', $category->id],
            ['phase', '=', 2],
        ])->get();
    }

    private function HandleValidateCategoryById($kategori_id): bool
    {
        if ($this->category->find($kategori_id)) {
            return true;
        }
        return false;
    }

    private function HandleGetCategoryById($category_id)
    {
        return $this->category->whereId($category_id)->first();
    }
    private function HandleGetCategoryDetailByIdCategory($category_id)
    {
        return $this->category_detail->where([
            ['kategori_materi_id', '=', $category_id],
            ['users_id', '=', Auth::guard('api')->user()->id]
        ])->first();
    }

    private function HandleValidateFieldCategoryDetailByUserID($kategori_id): bool
    {
        return $this->category_detail->where([
            ['kategori_materi_id', '=', $kategori_id],
            ['users_id', '=', Auth::guard('api')->user()->id]
        ])->first() ? true : false;
    }

    private function HandleCreateFieldCategoryDetailByUserID($kategori_id)
    {
        return $this->category_detail->insert(
            ['kategori_materi_id' => $kategori_id, 'users_id' => Auth::guard('api')->user()->id, 'created_at' => date('Y-m-d H:i:s')]
        );
    }

    private function HandleUpdateFieldCategoryDetailByUserID($category_id, $status_category)
    {
        return $this->category_detail
            ->where([
                ['kategori_materi_id', '=', $category_id],
                ['users_id', '=', Auth::guard('api')->user()->id]
            ])
            ->update(['status' => $status_category]);
    }
}
