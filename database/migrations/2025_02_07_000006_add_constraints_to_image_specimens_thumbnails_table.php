<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('image_specimen_thumbnails', function (Blueprint $table) {
            // Add foreign keys
            $table->foreign('image_specimen_id')->references('id')->on('image_specimens')->onDelete('cascade');
        });
    }

    public function down(): void
    {
        Schema::table('image_specimen_thumbnails', function (Blueprint $table) {
            // Drop foreign key
            $table->dropForeign(['image_specimen_id']);
        });
    }
};
