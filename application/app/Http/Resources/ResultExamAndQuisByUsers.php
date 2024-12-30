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
        $quis_collect = []; //quis
        $exam_collect = []; //exam

        //conditional list result quis by on batch from user
        if (DB::table('quis_answer')
            ->where('users_id', $this->id)
            ->exists()
        ) {
            if (
                DB::table('quis_answer')
                ->where('users_id', $this->id)
                ->first()->batch == 1
            ) {
                $quis = array(
                    "passed" => (int) DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', 1],
                    ])->sum('point') >= 100 ? true : false,
                    "score" => (int) DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', 1],
                    ])->sum('point'),
                    "right_answer" => (int) DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', 1],
                        ['point', '=', 20],
                    ])->get()->count(),
                    "wrong_answer" => (int) DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', 1],
                        ['point', '=', 0],
                    ])->get()->count(),
                    "batch" => 1,
                    "point_right_answer" => 20,
                    "total_soal" => 5,
                    "passing_grade" => 100,
                );
                array_push($quis_collect, $quis);
            }
            if (
                DB::table('quis_answer')
                ->where('users_id', $this->id)
                ->first()->batch == 2
            ) {
                $quis = array(
                    "passed" => (int) DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', 2],
                    ])->sum('point') >= 100 ? true : false,
                    "score" => (int) DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', 2],
                    ])->sum('point'),
                    "right_answer" => (int) DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', 2],
                        ['point', '=', 20],
                    ])->get()->count(),
                    "wrong_answer" => (int) DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', 2],
                        ['point', '=', 0],
                    ])->get()->count(),
                    "batch" => 2,
                    "point_right_answer" => 20,
                    "total_soal" => 5,
                    "passing_grade" => 100,
                );
                array_push($quis_collect, $quis);
            }
            if (
                DB::table('quis_answer')
                ->where('users_id', $this->id)
                ->first()->batch == 3
            ) {
                $quis = array(
                    "passed" => (int) DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', 3],
                    ])->sum('point') >= 100 ? true : false,
                    "score" => (int) DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', 3],
                    ])->sum('point'),
                    "right_answer" => (int) DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', 3],
                        ['point', '=', 20],
                    ])->get()->count(),
                    "wrong_answer" => (int) DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', 3],
                        ['point', '=', 0],
                    ])->get()->count(),
                    "batch" => 3,
                    "point_right_answer" => 20,
                    "total_soal" => 5,
                    "passing_grade" => 100,
                );
                array_push($quis_collect, $quis);
            }
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
