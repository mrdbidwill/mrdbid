
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

                     Schema::create('specimen_character', function (Blueprint $table) {

                         $table->id();

                         $table->foreignIdFor(\App\Models\Specimen::class)->constrained()->cascadeOnDelete();

                         $table->foreignIdFor(\App\Models\Character::class)->constrained()->cascadeOnDelete();

                         $table->string('character_value', length: 240);

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
