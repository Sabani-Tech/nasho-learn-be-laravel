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
        $quis_collect = [];
        $quis_show = [];

        //conditional result quis by on batch from user
        if (DB::table('quis_answer')
            ->where('users_id', $this->id)
            ->exists()
        ) {
            //quis by on batch 1
            if (DB::table('quis_answer')->where([
                ['users_id', '=', $this->id],
                ['batch', '=', 1]
            ])->exists()) {
                $quis = DB::table('quis_answer')->where([
                    ['users_id', '=', $this->id],
                    ['batch', '=', 1]
                ])->first();
                $quis_data = array(
                    "title" => DB::table('materi')->whereId(DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', $quis->batch],
                        ['materi_id', '=', $quis->materi_id],
                    ])->first()->materi_id)->first()->judul,
                    "passed" => (int) DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', $quis->batch],
                        ['materi_id', '=', $quis->materi_id],
                    ])->sum('point') >= 100 ? true : false,
                    "score" => (int) DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', $quis->batch],
                        ['materi_id', '=', $quis->materi_id],
                    ])->sum('point'),
                    "right_answer" => (int) DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', $quis->batch],
                        ['point', '=', 20],
                        ['materi_id', '=', $quis->materi_id],
                    ])->get()->count(),
                    "wrong_answer" => (int) DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', $quis->batch],
                        ['point', '=', 0],
                        ['materi_id', '=', $quis->materi_id],
                    ])->get()->count(),
                    "batch" => $quis->batch,
                    "point_right_answer" => 20,
                    "total_soal" => 5,
                    "passing_grade" => 100,
                );
                array_push($quis_collect, $quis_data);
            }

            //quis by on batch 2
            /**
             * loop pertama untuk list materi by batch 2
             * loop kedua show penilaian quis by users,batch and materi_id
             */
            foreach (
                DB::table('quis_answer')->where([
                    ['users_id', '=', $this->id],
                    ['batch', '=', 2],
                ])->get() as $key => $value
            ) {
                array_push($quis_collect, $value->materi_id);
            }

            $quis_collect = array_unique($quis_collect);
            foreach ($quis_collect as $key => $value) {
                $quis_data = array(
                    "title" => DB::table('materi')->whereId(DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', 2],
                        ['materi_id', '=', $value],
                    ])->first()->materi_id)->first()->judul,
                    "passed" => (int) DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', 2],
                        ['materi_id', '=', $value],
                    ])->sum('point') >= 100 ? true : false,
                    "score" => (int) DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', 2],
                        ['materi_id', '=', $value],
                    ])->sum('point'),
                    "right_answer" => (int) DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', 2],
                        ['point', '=', 20],
                        ['materi_id', '=', $value],
                    ])->get()->count(),
                    "wrong_answer" => (int) DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', 2],
                        ['point', '=', 0],
                        ['materi_id', '=', $value],
                    ])->get()->count(),
                    "batch" => 2,
                    "point_right_answer" => 20,
                    "total_soal" => 5,
                    "passing_grade" => 100,
                );
                array_push($quis_show, $quis_data);
            }

            //quis by on batch 3
            if (DB::table('quis_answer')->where([
                ['users_id', '=', $this->id],
                ['batch', '=', 3]
            ])->exists()) {
                $quis = DB::table('quis_answer')->where([
                    ['users_id', '=', $this->id],
                    ['batch', '=', 3]
                ])->first();
                $quis_data = array(
                    "title" => DB::table('materi')->whereId(DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', $quis->batch],
                        ['materi_id', '=', $quis->materi_id],
                    ])->first()->materi_id)->first()->judul,
                    "passed" => (int) DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', $quis->batch],
                        ['materi_id', '=', $quis->materi_id],
                    ])->sum('point') >= 100 ? true : false,
                    "score" => (int) DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', $quis->batch],
                        ['materi_id', '=', $quis->materi_id],
                    ])->sum('point'),
                    "right_answer" => (int) DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', $quis->batch],
                        ['point', '=', 20],
                        ['materi_id', '=', $quis->materi_id],
                    ])->get()->count(),
                    "wrong_answer" => (int) DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                        ['batch', '=', $quis->batch],
                        ['point', '=', 0],
                        ['materi_id', '=', $quis->materi_id],
                    ])->get()->count(),
                    "batch" => $quis->batch,
                    "point_right_answer" => 20,
                    "total_soal" => 5,
                    "passing_grade" => 100,
                );
                array_push($quis_collect, $quis_data);
            }
        }


        //conditional result exam by on batch from user
        if (DB::table('exam_answer')
            ->where('users_id')
            ->exists()
        ) {
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
            'quis' => $quis_show,
            'exam' => [],
        ];
    }
}
