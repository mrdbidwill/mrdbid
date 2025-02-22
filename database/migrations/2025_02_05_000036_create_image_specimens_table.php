
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

                     Schema::create('image_specimens', function (Blueprint $table) {

                         $table->id();

                         $table->foreignIdFor(\App\Models\Specimen::class);

                         $table->integer('parts')->nullable();

                         $table->text('description')->nullable();

                         $table->string('image_name', length: 240);

                         $table->string('file_address', length: 240);

                         $table->integer('image_width')->nullable();

                         $table->integer('image_height')->nullable();

                         $table->string('camera_make')->nullable();

                         $table->string('camera_model')->nullable();

                         $table->string('lens', length: 255)->nullable();

                         $table->string('exposure', length: 64)->nullable();

                         $table->string('aperture', length: 16)->nullable();

                         $table->string('iso', length: 16)->nullable();

                         $table->datetime('date_taken')->nullable();

                         $table->string('focal_length', length: 16)->nullable();

                         $table->string('GPSLatitudeRef', length: 16)->nullable();

                         $table->string('GPSLatitude_0', length: 16)->nullable();

                         $table->string('GPSLatitude_1', length: 16)->nullable();

                         $table->string('GPSLatitude_2', length: 16)->nullable();

                         $table->string('GPSLongitudeRef', length: 16)->nullable();

                         $table->string('GPSLongitude_0', length: 16)->nullable();

                         $table->string('GPSLongitude_1', length: 16)->nullable();

                         $table->string('GPSLongitude_2', length: 16)->nullable();

                         $table->string('GPSAltitudeRef', length: 16)->nullable();

                         $table->string('GPSAltitude', length: 16)->nullable();

                         $table->integer('entered_by');

                         $table->timestamps();

                     });

                 }

                 public function down(): void
                 {

                     Schema::dropIfExists('image_specimens');

                 }
             };
