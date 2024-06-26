
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

                    Schema::create('member_list_groups', function (Blueprint $table)

                    {

                        $table->id();

                        $table->integer('specimen_id');

                        $table->integer('group_id');

                        $table->integer('entered_by');

                        $table->timestamps();

                    });

             }

             

             public function down(): void

             {

                Schema::dropIfExists('member_list_groups');

             }

            };
