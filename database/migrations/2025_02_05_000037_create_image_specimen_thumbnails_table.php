<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('image_specimen_thumbnails', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('image_specimen_id');
            $table->string('thumbnail_file_address');
            $table->integer('image_width');
            $table->integer('image_height');
            $table->unsignedBigInteger('entered_by');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('image_specimen_thumbnails');
    }
};
