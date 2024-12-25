
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

                     Schema::create('clusters', function (Blueprint $table) {
                         $table->id();
                         $table->string('name', 240)->unique();
                         $table->text('description')->nullable();
                         $table->unsignedBigInteger('created_by'); // Reference to the user who created the cluster
                         $table->timestamps();

                         $table->foreign('created_by')->references('id')->on('users')->onDelete('cascade');
                     });

                 }

                 public function down(): void
                 {

                     Schema::dropIfExists('clusters');

                 }
             };
