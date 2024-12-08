<?php

namespace App\Repositories\v1\user\soal;

use Illuminate\Database\Eloquent\Model;

class SoalModel extends Model
{
    protected $table = 'soal';
    protected $casts = [
        'option' => 'array'
    ];
}

class SoalRepositories
{
    public function index()
    {
        return SoalModel::get();
    }
}
