<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class QuisModel extends Model
{
    protected $table = 'quis';
    protected $fillable = ['title', 'question', 'point', 'option', 'kategori_materi_id', 'materi_id', 'created_at', 'updated_at'];
    protected $casts = [
        'option' => 'array',
        'id' => 'string',
    ];
    protected $hidden = ['kategori_materi_id', 'materi_id'];
}
