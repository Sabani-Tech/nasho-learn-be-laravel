<?php

namespace App\Repositories\v1\admin\master_data;

use App\Models\User;

abstract class AbstractResultExamAndQuisRepositories
{
    protected $user;
    public function __construct()
    {
        $this->user = new User();
    }

    /**
     * @var int limit untuk per page nya 10
     */
    protected const limit = 10;
}
