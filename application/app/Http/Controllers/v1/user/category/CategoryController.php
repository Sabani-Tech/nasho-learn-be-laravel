<?php

namespace App\Http\Controllers\v1\user\category;

use App\Http\Controllers\Controller;
use App\Repositories\v1\user\category\EloquentCategoryRepositories;

class CategoryController
{
    public function __construct(
        private EloquentCategoryRepositories $eloquentCategoryRepositories,
        private Controller $controller,
    ) {}

    public function ListCategory()
    {
        return $this->controller->success_response($this->eloquentCategoryRepositories->ListCategory());
    }

    public function ListMateriByCategory($kategori_id)
    {
        return $this->eloquentCategoryRepositories->ListMateriByCategory($kategori_id, $this->controller);
    }

    public function UpdateStatusByCategoryId($category_id, $status_category)
    {
        return $this->eloquentCategoryRepositories->UpdateStatusByCategoryId($category_id, $status_category, $this->controller);
    }
}
