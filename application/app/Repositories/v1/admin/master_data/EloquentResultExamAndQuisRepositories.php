<?php

namespace App\Repositories\v1\admin\master_data;

use App\Models\CategoryMateriDetail;

class EloquentResultExamAndQuisRepositories implements ResultExamAndQuisRepositories
{
    public function Index($request)
    {
        return CategoryMateriDetail::all();
    }
}
