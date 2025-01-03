
             <?php

             use App\Models\User;
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

                     Schema::create('specimens', function (Blueprint $table) {

                         $table->id();
                         $table->foreignIdFor(User::class);
                         $table->string('specimen_name', length: 240);
                         $table->string('common_name', length: 240);
                         $table->text('description');
                         $table->text('comment');
                         $table->integer('specimen_location_now');
                         $table->string('location_found_city', length: 128);
                         $table->string('location_found_county', length: 64);
                         $table->integer('state_id');
                         $table->integer('country_id');
                         $table->integer('location_public_y_n');
                         $table->integer('share_data_y_n');
                         $table->integer('month_found');
                         $table->integer('day_found');
                         $table->integer('year_found');
                         $table->integer('fungus_type');
                         $table->integer('entered_by');
                         $table->timestamps();

                         // Add the indexes
                         $table->index('user_id', 'idx_user_id');
                         $table->index(['user_id', 'month_found', 'year_found'], 'idx_user_time'); // Composite index
                         $table->index(['state_id', 'country_id'], 'idx_location'); // Composite index

                         // Foreign key constraint
                         $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');

                     });

                 }

                 public function down(): void
                 {
                     Schema::dropIfExists('specimens');
                 }
             };
