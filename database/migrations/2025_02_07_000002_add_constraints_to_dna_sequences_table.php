<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('dna_sequences', function (Blueprint $table) {
            // Add foreign key
            $table->foreign('specimen_id')->references('id')->on('specimens')->onDelete('cascade');
        });
    }

    public function down(): void
    {
        Schema::table('dna_sequences', function (Blueprint $table) {
            // Drop foreign key
            $table->dropForeign(['specimen_id']);
        });
    }
};
