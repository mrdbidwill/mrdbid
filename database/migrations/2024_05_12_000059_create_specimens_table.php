
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

                     Schema::create('specimens', function (Blueprint $table) {

                         $table->id();
                         $table->integer('user_id');
                         $table->string('specimen_name', length: 240);
                         $table->string('common_name', length: 240);
                         $table->text('description');
                         $table->text('comment');
                         $table->integer('specimen_location_now');
                         $table->string('location_found_city', length: 128);
                         $table->string('location_found_county', length: 64);
                         $table->integer('state');
                         $table->integer('country');
                         $table->integer('location_public_y_n');
                         $table->integer('month_found');
                         $table->integer('day_found');
                         $table->integer('year_found');
                         $table->integer('fungus_type');
                         $table->integer('entered_by');
                         $table->timestamps();

                     });

                 }

                 public function down(): void
                 {

                     Schema::dropIfExists('specimens');

                 }
             };
