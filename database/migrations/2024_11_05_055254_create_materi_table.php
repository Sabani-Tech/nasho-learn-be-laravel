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
        Schema::create('materi', function (Blueprint $table) {
            $table->uuid('id')
                ->primary()
                ->default(DB::raw('(UUID())'));
            $table->string('embed');
            $table->string('phase');
            $table->string('judul');
            $table->string('permalink');
            $table->text('isi')->nullable();
            $table->text('file_uri');
            $table->uuid('kategori_materi_id');
            $table->integer('urutan');
            $table->tinyInteger('quis_status');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('materi');
    }
};
