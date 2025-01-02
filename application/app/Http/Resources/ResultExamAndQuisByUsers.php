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
        //quis
        $quis_collect = [];
        $quis_show = [];
        //exam
        //phase1
        $exam_collect_phase1 = [];
        $exam_show_phase1 = [];
        //phase1
        $exam_collect_phase2 = [];
        $exam_show_phase2 = [];


        //quis by on batch
        /**
         * loop pertama untuk list materi by batch
         * loop kedua show penilaian quis by users,batch and materi_id
         */

        foreach (
            DB::table('quis_answer')
                ->where('users_id', '=', $this->id)
                ->get() as $key => $value
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




        //exam on phase 1
        /**
         * loop pertama untuk list category_materi by phase1
         * loop kedua show penilaian exam by phase1,users and category_materi
         */
        foreach (
            DB::table('exam_answer')
                // ->where('users_id', '=', $this->id)
                ->where([
                    ['users_id', '=', $this->id],
                    ['phase', '=', 1],
                ])
                ->get() as $key => $value
        ) {
            array_push($exam_collect_phase1, $value->kategori_materi_id);
        }
        $exam_collect_phase1 = array_unique($exam_collect_phase1);
        foreach ($exam_collect_phase1 as $key => $value) {
            $exam_data_phase1 = array(
                "title" => DB::table('kategori_materi')->whereId(DB::table('exam_answer')->where([
                    ['users_id', '=', $this->id],
                    ['kategori_materi_id', '=', $value],
                    ['phase', '=', 1]
                ])->first()->kategori_materi_id)->first()->jenis,
                "passed" => (int) DB::table('exam_answer')->where([
                    ['users_id', '=', $this->id],
                    ['kategori_materi_id', '=', $value],
                    ['phase', '=', 1]
                ])->sum('point') >= 60 ? true : false,
                "score" => (int) DB::table('exam_answer')->where([
                    ['users_id', '=', $this->id],
                    ['kategori_materi_id', '=', $value],
                    ['phase', '=', 1]
                ])->sum('point'),
                "right_answer" => (int) DB::table('exam_answer')->where([
                    ['users_id', '=', $this->id],
                    ['point', '=', 10],
                    ['kategori_materi_id', '=', $value],
                    ['phase', '=', 1]
                ])->get()->count(),
                "wrong_answer" => (int) DB::table('exam_answer')->where([
                    ['users_id', '=', $this->id],
                    ['point', '=', 0],
                    ['kategori_materi_id', '=', $value],
                    ['phase', '=', 1]
                ])->get()->count(),
                "batch" => DB::table('exam_answer')
                    ->where([
                        ['kategori_materi_id', '=', $value],
                        ['phase', '=', 1],
                    ])->first()->batch,
                "point_right_answer" => 10,
                "total_soal" => 10,
                "passing_grade" => 60,
            );
            array_push($exam_show_phase1, $exam_data_phase1);
        }

        //exam on phase 2
        /**
         * loop pertama untuk list category_materi by phase2
         * loop kedua show penilaian exam by phase2,users and category_materi
         */
        foreach (
            DB::table('exam_answer')
                // ->where('users_id', '=', $this->id)
                ->where([
                    ['users_id', '=', $this->id],
                    ['phase', '=', 2],
                ])
                ->get() as $key => $value
        ) {
            array_push($exam_collect_phase2, $value->kategori_materi_id);
        }
        $exam_collect_phase2 = array_unique($exam_collect_phase2);
        foreach ($exam_collect_phase2 as $key => $value) {
            $exam_data_phase2 = array(
                "title" => DB::table('kategori_materi')->whereId(DB::table('exam_answer')->where([
                    ['users_id', '=', $this->id],
                    ['kategori_materi_id', '=', $value],
                    ['phase', '=', 2]
                ])->first()->kategori_materi_id)->first()->jenis,
                "passed" => (int) DB::table('exam_answer')->where([
                    ['users_id', '=', $this->id],
                    ['kategori_materi_id', '=', $value],
                    ['phase', '=', 2]
                ])->sum('point') >= 60 ? true : false,
                "score" => (int) DB::table('exam_answer')->where([
                    ['users_id', '=', $this->id],
                    ['kategori_materi_id', '=', $value],
                    ['phase', '=', 2]
                ])->sum('point'),
                "right_answer" => (int) DB::table('exam_answer')->where([
                    ['users_id', '=', $this->id],
                    ['point', '=', 10],
                    ['kategori_materi_id', '=', $value],
                    ['phase', '=', 2]
                ])->get()->count(),
                "wrong_answer" => (int) DB::table('exam_answer')->where([
                    ['users_id', '=', $this->id],
                    ['point', '=', 0],
                    ['kategori_materi_id', '=', $value],
                    ['phase', '=', 2]
                ])->get()->count(),
                "batch" => DB::table('exam_answer')
                    ->where([
                        ['kategori_materi_id', '=', $value],
                        ['phase', '=', 2],
                    ])->first()->batch,
                "point_right_answer" => 10,
                "total_soal" => 10,
                "passing_grade" => 60,
            );
            array_push($exam_show_phase2, $exam_data_phase2);
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
            'quis_list' => $quis_show,
            'exam_list' => [
                'phase1' => $exam_show_phase1,
                'phase2' => $exam_show_phase2,
            ],
            'quis_status' => DB::table('quis_answer')
                ->where('users_id', '=', $this->id)
                ->first() ? true : false,
            'exam_status' => DB::table('exam_answer')
                ->where('users_id', '=', $this->id)
                ->first() ? true : false,
        ];
    }
}
