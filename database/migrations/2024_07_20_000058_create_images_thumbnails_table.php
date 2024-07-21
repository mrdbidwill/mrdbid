
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

                     Schema::create('images_thumbnails', function (Blueprint $table) {

                         $table->id();

                         $table->foreignIdFor(\App\Models\Specimen::class)->constrained()->cascadeOnDelete();

                         $table->string('source_remote', length: 240);

                         $table->integer('image_width');

                         $table->integer('image_height');

                         $table->integer('entered_by');

                         $table->timestamps();

                     });

                 }

                 public function down(): void
                 {

                     Schema::dropIfExists('images_thumbnails');

                 }
             };
