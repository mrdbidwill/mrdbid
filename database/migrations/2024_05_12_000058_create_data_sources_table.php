
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

                     Schema::create('data_sources', function (Blueprint $table) {

                         $table->id();

                         $table->string('title', length: 240);

                         $table->string('author', length: 240);

                         $table->integer('type');

                         $table->text('comment');

                         $table->integer('my_rating')->nullable();

                         $table->string('my_comment')->nullable();

                         $table->integer('entered_by');

                         $table->timestamps();

                     });

                 }

                 public function down(): void
                 {

                     Schema::dropIfExists('data_sources');

                 }
             };
