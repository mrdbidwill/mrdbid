<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
public function up(): void
{
Schema::table('all_groups', function (Blueprint $table) {
// Add indexes
$table->foreign('created_by')->references('id')->on('users')->onDelete('cascade');
});
}

public function down(): void
{
Schema::table('all_groups', function (Blueprint $table) {
// Drop foreign keys and indexes
$table->dropForeign(['created_by']);
});
}
};
