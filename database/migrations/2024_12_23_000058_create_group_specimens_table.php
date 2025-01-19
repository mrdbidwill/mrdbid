
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

                     Schema::create('group_specimens', function (Blueprint $table) {
                         $table->id();
                         $table->unsignedBigInteger('group_id');
                         $table->unsignedBigInteger('specimen_id');
                         $table->timestamps();

                         $table->foreign('group_id')->references('id')->on('groups')->onDelete('cascade');
                         $table->foreign('specimen_id')->references('id')->on('specimens')->onDelete('cascade');

                         $table->unique(['group_id', 'specimen_id']); // Ensure each specimen can only belong to a group once
                     });

                 }

                 public function down(): void
                 {

                     Schema::dropIfExists('group_specimens');

                 }
             };
