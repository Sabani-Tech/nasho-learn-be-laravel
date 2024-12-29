<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

//Model
class Materi extends Model
{
    protected $table = 'materi';
    protected $hidden = ['isi'];
    protected $fillable = [
        'embed',
        'judul',
        'permalink',
        'isi',
        'file_uri',
        'quis_status',
        'kategori_materi_id',
        'created_at',
        'updated_at'
    ];
    protected $casts = [
        'id' => 'string',
        'created_at' => 'date:d-M-Y H:i:s',
        'updated_at' => 'date:d-M-y H:i:s',
        'quis_status' => 'integer',
        'phase' => 'integer'
    ];

    public function kategori(): HasOne
    {
        return $this->hasOne(CategoryMateri::class, 'id', 'kategori_materi_id');
    }
}
