<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('quis_answer', function (Blueprint $table) {
            $table->uuid('id')
                ->primary()
                ->default(DB::raw('(UUID())'));
            $table->integer('point');
            $table->integer('batch');
            $table->json('answer');
            $table->string('quis_id');
            $table->foreignId('users_id')->references('id')->on('users');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('quis_answer');
    }
};
