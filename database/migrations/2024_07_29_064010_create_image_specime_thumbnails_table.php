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
        Schema::create('image_specimen_thumbnails', function (Blueprint $table) {
            $table->id();
            $table->foreignId('specimen_id')->constrained()->onDelete('cascade');
            $table->string('thumbnail_file_address');
            $table->integer('image_width');
            $table->integer('image_height');
            $table->integer('entered_by');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('image_specime_thumbnails');
    }
};
