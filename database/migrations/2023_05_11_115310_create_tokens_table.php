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
        Schema::create('tokens', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_klien');
            $table->string('token');
            $table->unsignedBigInteger('level_klien');
            $table->foreign('id_klien')->references('id')->on('kliens')->onUpdate('cascade')->onDelete('restrict'); 
            $table->foreign('level_klien')->references('id')->on('levelkliens')->onUpdate('cascade')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tokens');
    }
};
