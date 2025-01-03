<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class HeaderReqSeederProduction extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('request_header')->insert([[
            'platform' => 'web-prod',
            'client_key' => Str::uuid(),
            'version' => '1.0',
            'created_at' => Carbon::now()->timezone(env('APP_TIMEZONE'))->format('Y-m-d H:i:s'),
            'updated_at' => Carbon::now()->timezone(env('APP_TIMEZONE'))->format('Y-m-d H:i:s'),
        ], [
            'platform' => 'internal-tools-prod',
            'client_key' => Str::uuid(),
            'version' => '1.0',
            'created_at' => Carbon::now()->timezone(env('APP_TIMEZONE'))->format('Y-m-d H:i:s'),
            'updated_at' => Carbon::now()->timezone(env('APP_TIMEZONE'))->format('Y-m-d H:i:s'),
        ], [
            'platform' => 'mobile-prod',
            'client_key' => Str::uuid(),
            'version' => '1.0',
            'created_at' => Carbon::now()->timezone(env('APP_TIMEZONE'))->format('Y-m-d H:i:s'),
            'updated_at' => Carbon::now()->timezone(env('APP_TIMEZONE'))->format('Y-m-d H:i:s'),
        ]]);
    }
}
