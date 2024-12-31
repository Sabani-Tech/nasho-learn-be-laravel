<?php

namespace App\Http\Controllers\v1\admin\master_data;

use App\Http\Controllers\Controller;
use App\Repositories\v1\admin\master_data\EloquentResultExamAndQuisRepositories;
use Illuminate\Http\Request;

class ResultExamAndQuisController
{
    public function __construct(
        private EloquentResultExamAndQuisRepositories $eloquentResultExamAndQuisRepositories,
        private Controller $controller,
    ) {}

    public function index(Request $request)
    {
        return $this->eloquentResultExamAndQuisRepositories->Index($request, $this->controller);
    }
}
