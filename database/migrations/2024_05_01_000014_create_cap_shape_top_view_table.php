
        <?php

        use Illuminate\Database\Migrations\Migration;
        use Illuminate\Database\Schema\Blueprint;
        use Illuminate\Support\Facades\Schema;

        return new class extends Migration
        {
            public function up(): void
            {

                Schema::create('cap_shape_top_view', function (Blueprint $table) {

                    $table->unsignedBigInteger('id')->autoIncrement()->unique();

                    $table->string('name');

                    $table->longText('description')->nullable();

                    $table->longText('comments')->nullable();

                    $table->integer('source');

                    $table->integer('entered_by');

                    $table->timestamps();

                });

            }

            public function down(): void
            {

                Schema::dropIfExists('cap_shape_top_view');

            }
        };
