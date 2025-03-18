<?php

namespace App\Http\Controllers\v1\admin\master_data;

use App\Http\Controllers\Controller;
use App\Repositories\v1\admin\master_data\EloquentResultExamAndQuisRepositories;
use Illuminate\Http\Request;

class ResultExamAndQuisController
{
    public function __construct(
        private EloquentResultExamAndQuisRepositories $eloquentResultExamAndQuisRepositories,
    ) {}

    public function index(Request $request)
    {
        $QUERY_REQUEST_FILTER = $request->query('nama_lengkap'); //query only for filter(search) nama lengkap
        return $this->eloquentResultExamAndQuisRepositories->Index($QUERY_REQUEST_FILTER, $request);
    }
}
