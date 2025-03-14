<?php

namespace App\Models\Lookup;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property int $specimen_id
 * @property string|null $notes
 * @property string|null $dna_barcode_its
 * @property string|null $genbank_number_url
 * @property int|null $genbank_accession_number
 * @property string|null $herbarium_catalog_number
 * @property string|null $mycomap_blast_results
 * @property string|null $provisional_species_name
 * @property int|null $reads_in_consensus_ric
 * @property string|null $sequencing_technology
 * @property string|null $trace_files_raw_dna_data
 * @property string|null $voucher_number
 * @property int $entered_by
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 *
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DnaSequence newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DnaSequence newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DnaSequence query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DnaSequence whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DnaSequence whereDnaBarcodeIts($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DnaSequence whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DnaSequence whereGenbankAccessionNumber($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DnaSequence whereGenbankNumberUrl($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DnaSequence whereHerbariumCatalogNumber($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DnaSequence whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DnaSequence whereMycomapBlastResults($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DnaSequence whereNotes($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DnaSequence whereProvisionalSpeciesName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DnaSequence whereReadsInConsensusRic($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DnaSequence whereSequencingTechnology($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DnaSequence whereSpecimenId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DnaSequence whereTraceFilesRawDnaData($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DnaSequence whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DnaSequence whereVoucherNumber($value)
 *
 * @mixin \Eloquent
 */
class DnaSequence extends Model
{
    use HasFactory;
}
