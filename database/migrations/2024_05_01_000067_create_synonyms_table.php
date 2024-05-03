
             <?php

             use Illuminate\Database\Migrations\Migration;
             use Illuminate\Database\Schema\Blueprint;
             use Illuminate\Support\Facades\Schema;

             return new class extends Migration
             {
                 public function up(): void
                 {

                     Schema::create('synonyms', function (Blueprint $table) {

                         $table->id()->primary()->unique();

                         $table->string('name');

                         $table->string('synonym_with');

                         $table->string('comments');

                         $table->integer('source');

                         $table->integer('entered_by');

                         $table->timestamps();

                     });

                 }

                 public function down(): void
                 {

                     Schema::dropIfExists('synonyms');

                 }
             };
