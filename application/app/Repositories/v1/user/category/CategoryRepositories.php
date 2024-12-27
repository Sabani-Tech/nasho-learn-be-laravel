<?php

namespace App\Repositories\v1\user\category;

//interface for repositories
interface CategoryRepositories
{
    public function ListCategory();
    public function ListMateriByCategory($kategori_id, $response);
    public function UpdateStatusByCategoryId($category_id, $status_category, $response);
}
