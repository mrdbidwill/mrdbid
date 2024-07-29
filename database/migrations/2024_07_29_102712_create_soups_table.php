<?php

use App\Models\Specimen;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('soups', function (Blueprint $table) {
            $table->id();
            $table->string('soup_name');
            $table->string('soup_description')->nullable();
            $table->foreignIdFor(Specimen::class, 'soup_relation')->constrained('specimens');
            $table->softDeletes();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('soups');
    }
};
