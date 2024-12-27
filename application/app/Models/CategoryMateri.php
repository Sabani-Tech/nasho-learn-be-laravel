<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

//Model
class CategoryMateri extends Model
{
    protected $table = 'kategori_materi';
    protected $fillable = [
        'jenis',
        'deskripsi',
        'created_at',
        'updated_at'
    ];

    protected $casts = [
        'id' => 'string',
        'created_at' => 'date:d-M-y H:i:s',
        'updated_at' => 'date:d-M-y H:i:s'
    ];
}
