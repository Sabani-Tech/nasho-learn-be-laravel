<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\DB;

class PembahasanResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'qustion' => DB::table('quis')->where('id', $this->quis_id)->first()->question,
            'point' => $this->point,
            'answer' => $this->answer,
            'right_answer' => DB::table('quis')->where('id', $this->quis_id)->first()->answer_key,
        ];
    }
}
