
             <?php

             use Illuminate\Database\Migrations\Migration;
             use Illuminate\Database\Schema\Blueprint;
             use Illuminate\Support\Facades\Schema;

             return new class extends Migration
             {
                 public function up(): void
                 {

                     Schema::create('member_list_clusters', function (Blueprint $table) {

                         $table->id()->primary()->unique();

                         $table->integer('specimen_id');

                         $table->integer('cluster_id');

                         $table->integer('entered_by');

                         $table->timestamps();

                     });

                 }

                 public function down(): void
                 {

                     Schema::dropIfExists('member_list_clusters');

                 }
             };
