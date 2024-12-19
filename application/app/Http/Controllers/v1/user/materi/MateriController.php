<?php

namespace App\Http\Controllers\v1\user\materi;

use App\Http\Controllers\Controller;
use App\Repositories\v1\user\materi\MateriRepositories;

class MateriController extends Controller
{
    public function __construct(
        private MateriRepositories $materiRepositories
    ) {}

    public function index($materi_id)
    {
        return $this->materiRepositories->Index($materi_id);
    }
}
