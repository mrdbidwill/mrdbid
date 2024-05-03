
             <?php

             use Illuminate\Database\Migrations\Migration;
             use Illuminate\Database\Schema\Blueprint;
             use Illuminate\Support\Facades\Schema;

             return new class extends Migration
             {
                 public function up(): void
                 {

                     Schema::create('specimen_characters', function (Blueprint $table) {

                         $table->id()->primary()->unique();

                         $table->integer('specimen_id');

                         $table->integer('character_id');

                         $table->string('character_value');

                         $table->integer('display_options');

                         $table->integer('entered_by');

                         $table->timestamps();

                     });

                 }

                 public function down(): void
                 {

                     Schema::dropIfExists('specimen_characters');

                 }
             };
