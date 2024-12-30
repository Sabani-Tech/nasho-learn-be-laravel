<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

//Model
class QuisAnswerModel extends Model
{
    protected $table = 'quis_answer';
    protected $fillable = [
        'point',
        'batch',
        'answer',
        'quis_id',
        'kategori_materi_id',
        'materi_id',
        'users_id',
        'created_at',
        'updated_at'
    ];
    protected $casts = [
        'id' => 'string'
    ];
}
