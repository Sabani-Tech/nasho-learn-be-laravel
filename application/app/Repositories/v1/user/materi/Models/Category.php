<?php

namespace App\Repositories\v1\user\materi\Models;

use Illuminate\Database\Eloquent\Model;

//Model
class Category extends Model
{
    protected $table = 'kategori_materi';
    protected $casts = [
        'id' => 'string',
        'created_at' => 'date:d-M-Y H:i:s',
        'updated_at' => 'date:d-M-Y H:i:s',
    ];
}
