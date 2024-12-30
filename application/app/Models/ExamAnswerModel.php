<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

//Model
class ExamAnswerModel extends Model
{
    protected $table = 'exam_answer';
    protected $fillable = [
        'point',
        'batch',
        'answer',
        'exam_id',
        'kategori_materi_id',
        'phase',
        'users_id',
        'created_at',
        'updated_at',
    ];
    protected $casts = [
        'id' => 'string',
    ];
}
