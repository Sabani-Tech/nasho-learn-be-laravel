<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class MateriResourceByPhase extends JsonResource
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
            "quis_status" => $this->quis_status == 1 ? false : true,
            "urutan" => $this->urutan,
            "kategori_materi_id" => $this->kategori_materi_id,
            "created_at" => $this->created_at,
            "updated_at" => $this->updated_at,
        ];
    }
}
