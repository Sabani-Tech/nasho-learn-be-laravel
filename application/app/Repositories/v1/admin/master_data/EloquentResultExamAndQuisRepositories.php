<?php

namespace App\Repositories\v1\admin\master_data;

use App\Http\Resources\ResultExamAndQuisByUsers;
use App\Models\CategoryMateriDetail;
use App\Models\User;

class EloquentResultExamAndQuisRepositories implements ResultExamAndQuisRepositories
{
    public function Index($request, $response)
    {
        return $response->success_response(ResultExamAndQuisByUsers::collection(User::when($request->nama_lengkap, function ($query) use ($request) {
            $query->where('nama_lengkap', 'like', "%$request->nama_lengkap%");
        })
            ->where('role_id', '!=', 2)
            ->get()), 'Successfully Get Result Exam');
    }
}
