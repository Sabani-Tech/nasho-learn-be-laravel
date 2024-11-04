<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Support\Facades\Hash;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('users')->insert([
            'nama_lengkap' => 'admin nasho learn',
            'email' => 'adminnasho@gmail.com',
            'username' => 'adminnasholearn',
            'password' => Hash::make('1234567890'),
            'role_id' => 2,
            'created_at' => Carbon::now()->timezone(env('APP_TIMEZONE'))->format('Y-m-d H:i:s'),
            'updated_at' => Carbon::now()->timezone(env('APP_TIMEZONE'))->format('Y-m-d H:i:s'),
        ]);
    }
}
