<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('specimen_clusters', function (Blueprint $table) {
            $table->id();
            $table->integer('member_id');
            $table->string('name');
            $table->string('comments')->nullable();
            $table->string('description');
            $table->integer('entered_by');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('specimen_clusters');
    }
};
