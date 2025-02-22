<?php

use App\Models\MrCharacter;
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

        Schema::create('mr_character_specimens', function (Blueprint $table) {

            $table->id();

            $table->foreignIdFor(MrCharacter::class);

            $table->foreignIdFor(Specimen::class);

            $table->string('character_value', length: 240);

            $table->integer('entered_by');

            $table->timestamps();

            $table->unique(['mr_character_id', 'specimen_id']);

        });

    }

    public function down(): void
    {

        Schema::dropIfExists('mr_character_specimens');

    }
};
