
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

                     Schema::create('characters', function (Blueprint $table) {

                         $table->id();

                         $table->string('name', length: 240);

                         $table->integer('display_options');

                         $table->boolean('look_up_y_n');

                         $table->integer('parts');

                         $table->integer('source');

                         $table->integer('entered_by');

                         $table->timestamps();

                     });

                 }

                 public function down(): void
                 {

                     Schema::dropIfExists('characters');

                 }
             };
