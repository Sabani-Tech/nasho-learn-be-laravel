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
        Schema::create('exam', function (Blueprint $table) {
            $table->uuid('id')
                ->primary()
                ->default(DB::raw('(UUID())'));
            $table->string('title', 128);
            $table->string('question', 128);
            $table->integer('point');
            $table->json('option');
            $table->integer('phase');
            $table->string('kategori_materi_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('exam');
    }
};
