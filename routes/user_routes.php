<?php

use App\Http\Controllers\ArticleController;
use App\Http\Controllers\MrCharacterController;
use App\Http\Controllers\MrCharacterSpecimenController;
use App\Http\Controllers\ClusterController;
use App\Http\Controllers\CompareController;
use App\Http\Controllers\DataSourceController;
use App\Http\Controllers\DataSourceDataTypeController;
use App\Http\Controllers\DisplayOptionController;
use App\Http\Controllers\DnaSequenceController;
use App\Http\Controllers\AllGroupController;
use App\Http\Controllers\ImageSpecimenController;
use App\Http\Controllers\PdfController;
use App\Http\Controllers\PlantAssociationController;
use App\Http\Controllers\PlantController;
use App\Http\Controllers\PossibleMatchController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ProjectBelongToController;
use App\Http\Controllers\SpecimenCompareController;
use App\Http\Controllers\SpecimenController;
use App\Http\Controllers\SupportArticleController;
use App\Http\Controllers\SynonymController;
use App\Http\Controllers\TreeController;
use App\Http\Controllers\UserTypeController;
use Illuminate\Support\Facades\Route;

Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');



    Route::resource('specimens', SpecimenController::class);

    // Add Specimen to Group
    Route::post('specimens/{specimen}/all_groups', [SpecimenController::class, 'addToGroup'])->name('specimens.addToGroup');

    // Add Specimen to Cluster
    Route::post('specimens/{specimen}/clusters', [SpecimenController::class, 'addToCluster'])->name('specimens.addToCluster');

    Route::resource('mr_characters', MrCharacterController::class);
    Route::resource('mr_character_specimens', MrCharacterSpecimenController::class);
    Route::get('/support-articles/{path?}', [SupportArticleController::class, 'show'])->where('path', '.*')->name('support-articles.show');
    Route::put('/specimens/{id}/update-field/{field}', [SpecimenController::class, 'updateField'])->name('specimens.updateField');
    Route::post('/specimens/{id}/date-found', [SpecimenController::class, 'dateFoundHandler'])->name('specimens.dateFoundHandler');
    Route::get('get-states', [SpecimenController::class, 'getStates'])->name('getStates');
    Route::resource('articles', ArticleController::class);
    Route::resource('trees', TreeController::class);

    Route::get('/compares', [CompareController::class, 'index']);
    Route::post('/compares', [CompareController::class, 'compare']);

    Route::get('/pdf/user-specimens', [PdfController::class, 'userSpecimens']);
    Route::get('/pdf/all-specimens', [PdfController::class, 'allSpecimens']);

    Route::get('/autocomplete/genus', [MrCharacterSpecimenController::class, 'autocompleteGenus']);
    Route::get('/autocomplete/species', [MrCharacterSpecimenController::class, 'autocompleteSpecies']);

    Route::resource('clusters', ClusterController::class);
    Route::resource('data_sources', DataSourceController::class);
    Route::resource('data_source_data_types', DataSourceDataTypeController::class);
    Route::resource('display_options', DisplayOptionController::class);
    Route::resource('dna_sequences', DnaSequenceController::class);
    Route::resource('image_specimens', ImageSpecimenController::class);
    Route::resource('member_list_clusters', ClusterController::class);
    Route::resource('all_groups', AllGroupController::class);
    Route::resource('member_types', UserTypeController::class);
    Route::resource('plant_associations', PlantAssociationController::class);
    Route::resource('plants', PlantController::class);
    Route::resource('possible_matches', PossibleMatchController::class);
    Route::resource('project_belongs_tos', ProjectBelongToController::class);
    Route::resource('clusters', ClusterController::class);
    Route::resource('specimen_compares', SpecimenCompareController::class);
    Route::resource('synonym', SynonymController::class);
    Route::resource('trees', TreeController::class);

});
