<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UjianModel extends Model
{
    protected $table = 'exam';
    protected $fillable = ['title', 'question', 'point', 'option', 'kategori_materi_id', 'created_at', 'updated_at'];
    protected $casts = [
        'option' => 'array',
        'id' => 'string',
    ];
    protected $hidden = [
        'kategori_materi_id',
        'phase',
    ];
}
