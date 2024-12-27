<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

//Model
class CategoryMateri extends Model
{
    protected $table = 'kategori_materi';
    protected $casts = [
        'id' => 'string',
        'created_at' => 'date:d-M-Y H:i:s',
        'updated_at' => 'date:d-M-Y H:i:s',
    ];
}
