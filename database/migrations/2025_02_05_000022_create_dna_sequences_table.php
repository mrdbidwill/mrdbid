
             <?php

             use App\Models\Specimen;
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

                     Schema::create('dna_sequences', function (Blueprint $table) {

                         $table->id();

                         $table->foreignIdFor(Specimen::class);

                         $table->text('notes')->nullable();

                         $table->text('dna_barcode_its')->nullable();

                         $table->string('genbank_number_url')->nullable();

                         $table->integer('genbank_accession_number')->nullable();

                         $table->string('herbarium_catalog_number')->nullable();

                         $table->string('mycomap_blast_results')->nullable();

                         $table->string('provisional_species_name')->nullable();   // move to specimen table?

                         $table->integer('reads_in_consensus_ric')->nullable();

                         $table->string('sequencing_technology')->nullable();

                         $table->string('trace_files_raw_dna_data')->nullable();

                         $table->string('voucher_number')->nullable();

                         $table->integer('entered_by');

                         $table->timestamps();

                     });

                 }

                 public function down(): void
                 {

                     Schema::dropIfExists('dna_sequences');

                 }
             };
