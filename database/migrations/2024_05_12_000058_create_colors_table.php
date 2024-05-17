
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

                    Schema::create('colors', function (Blueprint $table)

                    {

                        $table->id();

                        $table->string('latin_name', length: 240);

                        $table->string('common_name', length: 240);

                        $table->integer('color_group');

                        $table->string('hex');

                        $table->integer('sequence');

                        $table->integer('r_val');

                        $table->integer('g_val');
 
                        $table->integer('b_val');
  
                        $table->string('closest_websafe_color');
  
                        $table->integer('cwc_r');

                        $table->integer('cwc_g');
 
                        $table->integer('cwc_b');
                   
                        $table->string('image_file', length: 240);

                        $table->integer('entered_by');

                        $table->timestamps();

                    });

             }

             

             public function down(): void

             {

                Schema::dropIfExists('colors');

             }

            };
