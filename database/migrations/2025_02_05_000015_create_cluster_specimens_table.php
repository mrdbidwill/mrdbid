
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

                     Schema::create('cluster_specimens', function (Blueprint $table) {
                         $table->id();
                         $table->unsignedBigInteger('cluster_id');
                         $table->unsignedBigInteger('specimen_id');
                         $table->timestamps();
                     });

                 }

                 public function down(): void
                 {
                     Schema::dropIfExists('cluster_specimens');
                 }
             };
