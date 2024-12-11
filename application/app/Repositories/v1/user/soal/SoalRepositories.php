<?php

namespace App\Repositories\v1\user\soal;

use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Model;

class SoalModel extends Model
{
    protected $table = 'soal';
    protected $casts = [
        'option' => 'array'
    ];
}

class SoalRepositories extends Controller
{
    public function quis($category_id, $materi_id)
    {
        return $this->success_response(SoalModel::get());
    }

    public function exam($category_id) {}
}
