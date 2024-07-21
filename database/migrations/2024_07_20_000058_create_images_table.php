
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

                     Schema::create('images', function (Blueprint $table) {

                         $table->id();

                         $table->foreignIdFor(\App\Models\Specimen::class)->constrained()->cascadeOnDelete();

                         $table->integer('parts');

                         $table->text('description');

                         $table->string('source_remote', length: 240);

                         $table->string('source_local', length: 240);

                         $table->integer('image_width');

                         $table->integer('image_height');

                         $table->string('camera_make');

                         $table->string('camera_model');

                         $table->string('lens', length: 64);

                         $table->string('exposure', length: 64);

                         $table->string('aperture', length: 16);

                         $table->string('iso', length: 16);

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
