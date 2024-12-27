<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

//Model
class CategoryMateriDetail extends Model
{
    protected $table = 'kategori_materi_detail';
    protected $casts = [
        'created_at' => 'date:d-M-y H:i:s',
        'updated_at' => 'date:d-M-y H:i:s'
    ];
}
