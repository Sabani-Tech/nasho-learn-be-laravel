<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Resources\Json\JsonResource;

class PembahasanExamResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        foreach (json_decode(DB::table('exam')->where('id', $this->exam_id)->first()->option, true) as $key) {
            if ($key['key'] == DB::table('exam')->where('id', $this->exam_id)->first()->answer_key) {
                $CollectOptionRightAnswer = $key['value'];
            }
            $CollectOptionRightAnswer = $key['value'];
        }
        foreach (json_decode(DB::table('exam')->where('id', $this->exam_id)->first()->option, true) as $key) {
            if ($key['key'] == $this->answer) {
                $CollectOptionAnswer = $key['value'];
            }
        }
        return [
            'id' => $this->exam_id,
            'question' => DB::table('exam')->where('id', $this->exam_id)->first()->question,
            'point' => $this->point,
            'answer' => array(
                'key' => $this->answer,
                'value' => $CollectOptionAnswer,
            ),
            'right_answer' => array(
                'key' =>  DB::table('exam')->where('id', $this->exam_id)->first()->answer_key,
                'value' => $CollectOptionRightAnswer,
            ),
            // 'right_answer' => DB::table('exam')->where('id', $this->exam_id)->first()->answer_key,
        ];
    }
}
