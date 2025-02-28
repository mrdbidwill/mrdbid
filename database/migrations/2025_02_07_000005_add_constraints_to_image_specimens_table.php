<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
public function up(): void
{
Schema::table('image_specimens', function (Blueprint $table) {
// Add indexes

$table->foreign('specimen_id')->references('id')->on('specimens')->onDelete('cascade');
$table->unique(['specimen_id', 'image_name']);
});
}

public function down(): void
{
Schema::table('image_specimens', function (Blueprint $table) {
// Drop foreign keys and indexes
$table->dropForeign(['specimen_id']);
$table->dropUnique(['specimen_id', 'image_name']);
});
}
};
