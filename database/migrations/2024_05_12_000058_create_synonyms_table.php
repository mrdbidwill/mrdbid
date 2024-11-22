
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

                    Schema::create('synonyms', function (Blueprint $table)

                    {

                        $table->id();

                        $table->string('name', length: 240);

                        $table->string('synonym_with', length: 240);

                        $table->text('comments');

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
