<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UjianModel extends Model
{
    protected $table = 'exam';
    protected $casts = [
        'option' => 'array',
        'id' => 'string',
    ];
    protected $hidden = [
        'kategori_materi_id',
        'materi_id',
        'phase'
    ];
}
