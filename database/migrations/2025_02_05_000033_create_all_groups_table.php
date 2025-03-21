
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
                     Schema::create('all_groups', function (Blueprint $table) {
                         $table->id(); // Primary key
                         $table->string('name', 240)->unique();
                         $table->text('description')->nullable();
                         $table->unsignedBigInteger('created_by'); // Reference to the user who created the group
                         $table->timestamps();
                     });

                 }

                 public function down(): void
                 {
                     Schema::dropIfExists('all_groups');
                 }
             };
