<?php

namespace App\Repositories\v1\user\category;

use App\Models\Materi;
use App\Models\CategoryMateriDetail;
use Illuminate\Support\Facades\Auth;
use App\Http\Resources\MateriResource;
use App\Http\Resources\GetMateriByCategoryResource;
use App\Models\CategoryMateri;

//repositories
class EloquentCategoryRepositories implements CategoryRepositories
{
    private $category_materi, $category_materi_detail, $materi;
    public function __construct()
    {
        $this->category_materi = new CategoryMateri();
        $this->category_materi_detail = new CategoryMateriDetail();
        $this->materi = new Materi();
    }

    public function ListCategory()
    {
        return GetMateriByCategoryResource::collection($this->category_materi->get());
    }

    public function ListMateriByCategory($kategori_id, $response)
    {
        if (!$this->HandleValidateCategoryById($kategori_id)) {
            return $response->error_response('Category not found', 422);
        }

        //check ID user for field category detail
        if (!$this->HandleValidateFieldCategoryDetailByUserID($kategori_id)) {
            $this->HandleCreateFieldCategoryDetailByUserID($kategori_id);
        }

        $category = $this->HandleGetCategoryById($kategori_id);
        $category_detail = $this->HandleGetCategoryDetailByIdCategory($kategori_id);
        return $response->success_response($this->_GetCustomOfListMateriByCategory($category, $category_detail));
    }

    public function UpdateStatusByCategoryId($category_id, $status_category, $response)
    {
        if (!$this->HandleValidateCategoryById($category_id)) {
            return $response->error_response('Category not found', 422);
        }

        $status = $this->HandleUpdateFieldCategoryDetailByUserID($category_id, $status_category);
        return $response->success_response($status, 'Success Update Status Category');
    }

    //Handler Of Repositories
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
        return MateriResource::collection($this->materi->where([
            ['kategori_materi_id', '=', $category->id],
            ['phase', '=', 1],
        ])->orderBy('urutan')->get());
    }

    private function HandleGetListMateriByIdCategoryOfMateriPhase2($category)
    {
        return MateriResource::collection($this->materi->where([
            ['kategori_materi_id', '=', $category->id],
            ['phase', '=', 2],
        ])->orderBy('urutan')->get());
    }

    private function HandleValidateCategoryById($kategori_id): bool
    {
        if ($this->category_materi->find($kategori_id)) {
            return true;
        }
        return false;
    }

    private function HandleGetCategoryById($category_id)
    {
        return $this->category_materi->whereId($category_id)->first();
    }
    private function HandleGetCategoryDetailByIdCategory($category_id)
    {
        return $this->category_materi_detail->where([
            ['kategori_materi_id', '=', $category_id],
            ['users_id', '=', Auth::guard('api')->user()->id]
        ])->first();
    }

    private function HandleValidateFieldCategoryDetailByUserID($kategori_id): bool
    {
        return $this->category_materi_detail->where([
            ['kategori_materi_id', '=', $kategori_id],
            ['users_id', '=', Auth::guard('api')->user()->id]
        ])->first() ? true : false;
    }

    private function HandleCreateFieldCategoryDetailByUserID($kategori_id)
    {
        return $this->category_materi_detail->insert(
            ['kategori_materi_id' => $kategori_id, 'users_id' => Auth::guard('api')->user()->id, 'created_at' => date('Y-m-d H:i:s')]
        );
    }

    private function HandleUpdateFieldCategoryDetailByUserID($category_id, $status_category)
    {
        return $this->category_materi_detail
            ->where([
                ['kategori_materi_id', '=', $category_id],
                ['users_id', '=', Auth::guard('api')->user()->id]
            ])
            ->update(['status' => $status_category]);
    }
}
