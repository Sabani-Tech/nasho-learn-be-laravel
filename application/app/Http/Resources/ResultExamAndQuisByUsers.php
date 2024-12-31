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
            //quis by on batch
            /**
             * loop pertama untuk list materi by batch
             * loop kedua show penilaian quis by users,batch and materi_id
             */
            if (DB::table('quis_answer')->where([
                ['users_id', '=', $this->id],
            ])->exists()) {
                foreach (
                    DB::table('quis_answer')->where([
                        ['users_id', '=', $this->id],
                    ])->get() as $key => $value
                ) {
                    array_push($quis_collect, $value->materi_id);
                }

                $quis_collect = array_unique($quis_collect);
                foreach ($quis_collect as $key => $value) {
                    $quis_data = array(
                        "title" => DB::table('materi')->whereId(DB::table('quis_answer')->where([
                            ['users_id', '=', $this->id],
                            ['materi_id', '=', $value],
                        ])->first()->materi_id)->first()->judul,
                        "passed" => (int) DB::table('quis_answer')->where([
                            ['users_id', '=', $this->id],
                            ['materi_id', '=', $value],
                        ])->sum('point') >= 100 ? true : false,
                        "score" => (int) DB::table('quis_answer')->where([
                            ['users_id', '=', $this->id],
                            ['materi_id', '=', $value],
                        ])->sum('point'),
                        "right_answer" => (int) DB::table('quis_answer')->where([
                            ['users_id', '=', $this->id],
                            ['point', '=', 20],
                            ['materi_id', '=', $value],
                        ])->get()->count(),
                        "wrong_answer" => (int) DB::table('quis_answer')->where([
                            ['users_id', '=', $this->id],
                            ['point', '=', 0],
                            ['materi_id', '=', $value],
                        ])->get()->count(),
                        "batch" => DB::table('quis_answer')
                            ->wheremateri_id($value)
                            ->first()->batch,
                        "point_right_answer" => 20,
                        "category" => DB::table('kategori_materi')->whereId(DB::table('quis_answer')
                            ->wheremateri_id($value)
                            ->first()->kategori_materi_id)->first()->jenis,
                        "total_soal" => 5,
                        "passing_grade" => 100,
                    );
                    array_push($quis_show, $quis_data);
                }
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
