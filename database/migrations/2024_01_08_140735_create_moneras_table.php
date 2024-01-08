<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('moneras', function (Blueprint $table) {
            $table->id();
            $table->string('specimen_name');
            $table->integer('specimen_owner');
            $table->string('comments')->nullable();
            $table->string('common_name');
            $table->tinyInteger('date_month_found');
            $table->tinyInteger('date_day_found');
            $table->mediumInteger('date_year_found');
            $table->string('location_found_county');
            $table->string('location_found_city')->nullable();
            $table->smallInteger('state');
            $table->smallInteger('country');
            $table->smallInteger('annulus_position');
            $table->smallInteger('cap_context_flesh_texture');
            $table->integer('entered_by');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('moneras');
    }
};
