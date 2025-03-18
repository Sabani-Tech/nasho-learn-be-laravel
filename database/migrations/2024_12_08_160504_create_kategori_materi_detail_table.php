<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('kategori_materi_detail', function (Blueprint $table) {
            $table->id();
            $table->enum('exam1', ['false', 'true']);
            $table->enum('exam2', ['false', 'true']);
            // $table->enum('status', ['Materi1', 'Exam1', 'Materi2', 'Exam2']);
            $table->enum('status', ['Exam1', 'Exam2']);
            $table->string('kategori_materi_id');
            $table->foreignId('users_id')->references('id')->on('users');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('kategori_materi_detail');
    }
};
