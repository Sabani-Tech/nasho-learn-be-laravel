<?php

namespace App\Repositories\v1\user\materi\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

//Model
class Materi extends Model
{
    protected $table = 'materi';
    protected $guarded = ['id'];
    protected $hidden = ['isi'];
    protected $casts = [
        'id' => 'string',
        'created_at' => 'date:d-M-Y H:i:s',
        'quis_status' => 'integer',
        'phase' => 'integer'
    ];
}
