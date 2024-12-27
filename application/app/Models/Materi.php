<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

//Model
class Materi extends Model
{
    protected $table = 'materi';
    protected $hidden = ['isi'];
    protected $casts = [
        'id' => 'string',
        'created_at' => 'date:d-M-Y H:i:s',
        'quis_status' => 'integer',
        'phase' => 'integer'
    ];
}
