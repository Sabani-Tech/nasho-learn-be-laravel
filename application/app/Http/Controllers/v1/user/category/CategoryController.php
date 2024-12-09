<?php

namespace App\Http\Controllers\v1\user\category;

use App\Http\Controllers\Controller;
use App\Repositories\v1\user\category\CategoryRepositories;

class CategoryController extends Controller
{
    public function __construct(
        private CategoryRepositories $categoryRepositories
    ) {}

    public function ListCategory()
    {
        return $this->success_response($this->categoryRepositories->ListCategory());
    }

    public function ListMateriByCategory($kategori_id)
    {
        return $this->categoryRepositories->ListMateriByCategory($kategori_id);
    }

    public function UpdateStatusByCategoryId($category_id, $status_category)
    {
        return $this->categoryRepositories->UpdateStatusByCategoryId($category_id, $status_category);
    }
}
