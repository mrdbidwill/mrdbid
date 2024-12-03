
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

                         $table->foreignIdFor(\App\Models\Specimen::class)->constrained()->cascadeOnDelete();

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

                         $table->integer('entered_by');

                         $table->timestamps();

                         $table->unique(['specimen_id', 'image_name']);

                     });

                 }

                 public function down(): void
                 {

                     Schema::dropIfExists('image_specimens');

                 }
             };
