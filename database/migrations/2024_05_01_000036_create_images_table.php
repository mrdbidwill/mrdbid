
             <?php

             use Illuminate\Database\Migrations\Migration;
             use Illuminate\Database\Schema\Blueprint;
             use Illuminate\Support\Facades\Schema;

             return new class extends Migration
             {
                 public function up(): void
                 {

                     Schema::create('images', function (Blueprint $table) {

                         $table->id()->primary()->unique();

                         $table->integer('specimen_id');

                         $table->integer('parts');

                         $table->string('description');

                         $table->string('source_remote');

                         $table->string('source_local');

                         $table->integer('image_width');

                         $table->integer('image_height');

                         $table->string('camera_make');

                         $table->string('camera_model');

                         $table->string('lens');

                         $table->string('exposure');

                         $table->string('aperture');

                         $table->string('iso');

                         $table->datetime('date_taken');

                         $table->integer('entered_by');

                         $table->timestamps();

                     });

                 }

                 public function down(): void
                 {

                     Schema::dropIfExists('images');

                 }
             };
