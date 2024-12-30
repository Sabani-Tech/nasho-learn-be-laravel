<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class GetMateriByCategoryResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        // return parent::toArray($request);

        return [
            'id' => $this->id,
            'jenis' => $this->jenis,
            'deskripsi' => $this->deskripsi,
            'jenis_arab' => $this->jenis == 'Nahwu' || $this->jenis == 'nahwu' ? 'نحو' : 'صرف',
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
