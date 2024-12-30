<?php

namespace App\Http\Controllers\v1\user\materi;

use App\Http\Controllers\Controller;
use App\Repositories\v1\user\materi\EloquentGetDetailMateriRepositories;

//Controller
class GetDetailMateriController
{
    public function __construct(
        private Controller $controller,
        private EloquentGetDetailMateriRepositories $eloquentGetDetailMateriRepositories,
    ) {}

    public function Index($materi_id)
    {
        return $this->eloquentGetDetailMateriRepositories->Index($materi_id, $this->controller);
    }
}
