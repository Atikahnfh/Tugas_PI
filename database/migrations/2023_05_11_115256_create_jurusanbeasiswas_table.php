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
        Schema::create('jurusanbeasiswas', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_beasiswa');
            $table->unsignedBigInteger('id_beasiswa_khsjrsn');
            $table->integer('ipk_min');
            $table->foreign('id_beasiswa')->references('id')->on('beasiswas')->onUpdate('cascade')->onDelete('restrict');
            $table->foreign('id_beasiswa_khsjrsn')->references('id')->on('jurusans')->onUpdate('cascade')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('jurusanbeasiswas');
    }
};
