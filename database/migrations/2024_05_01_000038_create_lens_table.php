
             <?php

             use Illuminate\Database\Migrations\Migration;
             use Illuminate\Database\Schema\Blueprint;
             use Illuminate\Support\Facades\Schema;

             return new class extends Migration
             {
                 public function up(): void
                 {

                     Schema::create('lens', function (Blueprint $table) {

                         $table->id()->primary()->unique();

                         $table->string('make');

                         $table->string('model');

                         $table->integer('entered_by');

                         $table->timestamps();

                     });

                 }

                 public function down(): void
                 {

                     Schema::dropIfExists('lens');

                 }
             };
