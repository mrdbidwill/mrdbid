
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
                     Schema::create('all_group_specimens', function (Blueprint $table) {
                         $table->id();
                         $table->unsignedBigInteger('all_group_id');
                         $table->unsignedBigInteger('specimen_id');
                         $table->timestamps();
                     });

                 }

                 public function down(): void
                 {
                     Schema::dropIfExists('all_group_specimens');

                 }
             };
