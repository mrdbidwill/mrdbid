<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
public function up(): void
{
Schema::table('mr_character_specimens', function (Blueprint $table) {

// Add foreign keys
$table->foreign('mr_character_id')->references('id')->on('mr_characters')->onDelete('cascade');
$table->foreign('specimen_id')->references('id')->on('specimens')->onDelete('cascade');
});
}

public function down(): void
{
Schema::table('mr_character_specimens', function (Blueprint $table) {
// Drop foreign keys
    $table->dropForeign(['mr_character_id']);
    $table->dropForeign(['specimen_id']);
});
}
};
