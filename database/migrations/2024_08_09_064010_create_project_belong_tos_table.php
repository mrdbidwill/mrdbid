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
        Schema::create('project_belong_tos', function (Blueprint $table) {
            $table->id();

            $table->string('name', length: 240);

            $table->text('description')->nullable();

            $table->text('comments')->nullable();

            $table->integer('source');

            $table->integer('entered_by');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('project_belong_tos');
    }
};
