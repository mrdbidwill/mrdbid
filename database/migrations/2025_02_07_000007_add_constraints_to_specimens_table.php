<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('specimens', function (Blueprint $table) {
            // Add indexes
            $table->index('user_id', 'idx_user_id');
            $table->index(['user_id', 'month_found', 'year_found'], 'idx_user_time');
            $table->index(['state_id', 'country_id'], 'idx_location');

            // Add foreign keys
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    public function down(): void
    {
        Schema::table('specimens', function (Blueprint $table) {
            // Drop foreign keys and indexes
            $table->dropForeign(['user_id']);
            $table->dropIndex('idx_user_id');
            $table->dropIndex('idx_user_time');
            $table->dropIndex('idx_location');
        });
    }
};
