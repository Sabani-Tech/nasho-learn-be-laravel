<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RolesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('role')
            ->insert([[
                'name' => 'user',
                'created_at' => Carbon::now()->timezone(env('APP_TIMEZONE'))->format('Y-m-d H:i:s'),
                'updated_at' => Carbon::now()->timezone(env('APP_TIMEZONE'))->format('Y-m-d H:i:s'),
            ], [
                'name' => 'admin',
                'created_at' => Carbon::now()->timezone(env('APP_TIMEZONE'))->format('Y-m-d H:i:s'),
                'updated_at' => Carbon::now()->timezone(env('APP_TIMEZONE'))->format('Y-m-d H:i:s'),
            ]]);
    }
}
