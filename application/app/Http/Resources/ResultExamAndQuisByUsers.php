<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\DB;

class ResultExamAndQuisByUsers extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        //collect data
        $quis_collect = '';

        //conditional list result quis by on batch from user
        if (DB::table('quis_answer')
            ->where('users_id', $this->id)
            ->exists()
        ) {
            $quis = array(
                "passed" => (int) DB::table('quis_answer')->where([
                    ['users_id', '=', $this->id],
                    ['batch', '=', DB::table('quis_answer')
                        ->where('users_id', $this->id)
                        ->first()->batch],
                ])->sum('point') >= 100 ? true : false,
                "score" => (int) DB::table('quis_answer')->where([
                    ['users_id', '=', $this->id],
                    ['batch', '=', DB::table('quis_answer')
                        ->where('users_id', $this->id)
                        ->first()->batch],
                ])->sum('point'),
                "right_answer" => (int) DB::table('quis_answer')->where([
                    ['users_id', '=', $this->id],
                    ['batch', '=', DB::table('quis_answer')
                        ->where('users_id', $this->id)
                        ->first()->batch],
                    ['point', '=', 20],
                ])->get()->count(),
                "wrong_answer" => (int) DB::table('quis_answer')->where([
                    ['users_id', '=', $this->id],
                    ['batch', '=', DB::table('quis_answer')
                        ->where('users_id', $this->id)
                        ->first()->batch],
                    ['point', '=', 0],
                ])->get()->count(),
                "batch" => DB::table('quis_answer')
                    ->where('users_id', $this->id)
                    ->first()->batch,
                "point_right_answer" => 20,
                "total_soal" => 5,
                "passing_grade" => 100,
            );
            $quis_collect = $quis;
        }

        //mock response
        return [
            'id' => $this->id,
            'nama_lengkap' => $this->nama_lengkap,
            'email' => $this->email,
            'username' => $this->username,
            'role' => DB::table('role')
                ->where('id', $this->role_id)
                ->first(),
            'created_at' => date_format($this->created_at, 'Y-m-d H:i:s'),
            'updated_at' => date_format($this->updated_at, 'Y-m-d H:i:s'),
            'quis' => $quis_collect,
            'exam' => [],
        ];
    }
}
