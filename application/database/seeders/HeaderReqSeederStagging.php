<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class HeaderReqSeederStagging extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('request_header')->insert([[
            'platform' => 'web',
            'client_key' => Str::uuid(),
            'version' => '1.0',
            'created_at' => Carbon::now()->timezone(env('APP_TIMEZONE'))->format('Y-m-d H:i:s'),
            'updated_at' => Carbon::now()->timezone(env('APP_TIMEZONE'))->format('Y-m-d H:i:s'),
        ], [
            'platform' => 'internal-tools',
            'client_key' => Str::uuid(),
            'version' => '1.0',
            'created_at' => Carbon::now()->timezone(env('APP_TIMEZONE'))->format('Y-m-d H:i:s'),
            'updated_at' => Carbon::now()->timezone(env('APP_TIMEZONE'))->format('Y-m-d H:i:s'),
        ], [
            'platform' => 'mobile',
            'client_key' => Str::uuid(),
            'version' => '1.0',
            'created_at' => Carbon::now()->timezone(env('APP_TIMEZONE'))->format('Y-m-d H:i:s'),
            'updated_at' => Carbon::now()->timezone(env('APP_TIMEZONE'))->format('Y-m-d H:i:s'),
        ]]);
    }
}
