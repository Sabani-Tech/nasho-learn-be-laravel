<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\DB;

class MateriDetailResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            "id" => $this->id,
            "embed" => $this->embed,
            "phase" => $this->phase,
            "judul" => $this->judul,
            "permalink" => $this->permalink,
            "file_uri" => url("assets/{$this->file_uri}"),
            "quis_status" => $this->quis_status,
            "urutan" => $this->urutan,
            "kategori_materi_id" => DB::table('kategori_materi')
                ->whereId($this->kategori_materi_id)
                ->first(),
            "created_at" => date_format($this->created_at, 'M-d-Y H:i:s'),
            "updated_at" => date_format($this->updated_at, 'M-d-Y H:i:s'),
        ];
    }
}
