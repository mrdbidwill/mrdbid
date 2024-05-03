
             <?php

             use Illuminate\Database\Migrations\Migration;
             use Illuminate\Database\Schema\Blueprint;
             use Illuminate\Support\Facades\Schema;

             return new class extends Migration
             {
                 public function up(): void
                 {

                     Schema::create('characters', function (Blueprint $table) {

                         $table->unsignedBigInteger('id')->autoIncrement()->unique();

                         $table->string('name');

                         $table->integer('display_options');

                         $table->integer('look_up_y_n');

                         $table->integer('part');

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
