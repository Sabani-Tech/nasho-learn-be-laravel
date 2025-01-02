<?php

namespace App\Repositories\v1\admin\master_data;

use App\Http\Resources\ResultExamAndQuisByUsers;

class EloquentResultExamAndQuisRepositories extends AbstractResultExamAndQuisRepositories implements ResultExamAndQuisRepositories
{
    public function Index($QUERY_REQUEST_FILTER, $request)
    {
        $limit = $this->_GetLimitPerPage($request);
        return ResultExamAndQuisByUsers::collection($this->user::when($QUERY_REQUEST_FILTER, function ($query) use ($QUERY_REQUEST_FILTER) {
            $query->where('nama_lengkap', 'like', "%$QUERY_REQUEST_FILTER%");
        })
            ->where('role_id', '!=', 2) //condition
            ->paginate($limit));
    }

    private function _SetLimitPerPage($request)
    {
        $limit = static::limit;
        if ($limit >= $request->limit) {
            $limit = $request->limit;
        }
        return $limit;
    }

    private function _GetLimitPerPage($request)
    {
        return $this->_SetLimitPerPage($request);
    }
}
