<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
public function up(): void
{
Schema::table('cluster_specimens', function (Blueprint $table) {
    // Add foreign keys
$table->foreign('cluster_id')->references('id')->on('clusters')->onDelete('cascade');
$table->foreign('specimen_id')->references('id')->on('specimens')->onDelete('cascade');

$table->unique(['cluster_id', 'specimen_id']); // Ensure each specimen can only belong to a group once
});
}

public function down(): void
{
Schema::table('cluster_specimens', function (Blueprint $table) {
// Drop foreign keys
$table->dropForeign(['cluster_id']);
$table->dropForeign(['specimen_id']);

// Drop the unique constraint
$table->dropUnique(['cluster_id', 'specimen_id']);
});
}
};
