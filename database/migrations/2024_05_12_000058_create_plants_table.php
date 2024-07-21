
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

                    Schema::create('plants', function (Blueprint $table)

                    {

                        $table->id();

                        $table->integer('specimen_id');

                        $table->integer('plant_id');

                        $table->text('comments');

                        $table->integer('source');

                        $table->integer('entered_by');

                        $table->timestamps();

                    });

             }

             

             public function down(): void

             {

                Schema::dropIfExists('plants');

             }

            };
