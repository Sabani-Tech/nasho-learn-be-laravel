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
        foreach (json_decode(DB::table('quis')->where('id', $this->quis_id)->first()->option, true) as $key) {
            if ($key['key'] == DB::table('quis')->where('id', $this->quis_id)->first()->answer_key) {
                $CollectOptionRightAnswer = $key['value'];
            }
        }
        foreach (json_decode(DB::table('quis')->where('id', $this->quis_id)->first()->option, true) as $key) {
            if ($key['key'] == $this->answer) {
                $CollectOptionAnswer = $key['value'];
            }
        }
        return [
            'id' => $this->id,
            'qustion' => DB::table('quis')->where('id', $this->quis_id)->first()->question,
            'point' => $this->point,
            'answer' => array(
                'key' => $this->answer,
                'value' => $CollectOptionAnswer,
            ),
            'right_answer' => array(
                'key' =>  DB::table('quis')->where('id', $this->quis_id)->first()->answer_key,
                'value' => $CollectOptionRightAnswer,
            ),
            // 'right_answer' => DB::table('quis')->where('id', $this->quis_id)->first()->answer_key,
        ];
    }
}
