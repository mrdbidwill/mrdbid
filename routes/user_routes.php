<?php

use App\Http\Controllers\ArticleController;
use App\Http\Controllers\CharacterController;
use App\Http\Controllers\CharacterSpecimenController;
use App\Http\Controllers\CompareController;
use App\Http\Controllers\DataSourceController;
use App\Http\Controllers\DataSourceDataTypeController;
use App\Http\Controllers\DisplayOptionController;
use App\Http\Controllers\DnaSequenceController;
use App\Http\Controllers\ImageSpecimenController;
use App\Http\Controllers\MemberListClusterController;
use App\Http\Controllers\MemberListGroupController;
use App\Http\Controllers\MemberTypeController;
use App\Http\Controllers\PdfController;
use App\Http\Controllers\PlantAssociationController;
use App\Http\Controllers\PlantController;
use App\Http\Controllers\PossibleMatchController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ProjectBelongToController;
use App\Http\Controllers\SpecimenClusterController;
use App\Http\Controllers\SpecimenCompareController;
use App\Http\Controllers\SpecimenController;
use App\Http\Controllers\SpecimenGroupController;
use App\Http\Controllers\SupportArticleController;
use App\Http\Controllers\SynonymController;
use App\Http\Controllers\TreeController;
use Illuminate\Support\Facades\Route;

Route::middleware(['auth', 'verified'])->namespace('App\Http\Controllers')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::resource('specimens', SpecimenController::class);
    Route::resource('characters', CharacterController::class);
    Route::resource('character_specimens', CharacterSpecimenController::class);
    Route::get('/support-articles/{path?}', [SupportArticleController::class, 'show'])->where('path', '.*')->name('support-articles.show');
    Route::put('/specimens/{id}/update-field/{field}', [SpecimenController::class, 'updateField'])->name('specimens.updateField');
    Route::post('/specimens/{id}/date-found', [SpecimenController::class, 'dateFoundHandler'])->name('specimens.dateFoundHandler');
    Route::get('get-states', [SpecimenController::class, 'getStates'])->name('getStates');
    Route::resource('articles', ArticleController::class);
    Route::resource('trees', TreeController::class);

    Route::get('/compare', [CompareController::class, 'index']);
    Route::post('/compare', [CompareController::class, 'compare']);

    Route::get('/pdf/user-specimens', [PdfController::class, 'userSpecimens']);
    Route::get('/pdf/all-specimens', [PdfController::class, 'allSpecimens']);

    Route::get('/autocomplete/genus', [CharacterSpecimenController::class, 'autocompleteGenus']);
    Route::get('/autocomplete/species', [CharacterSpecimenController::class, 'autocompleteSpecies']);

    Route::resource('data_source', DataSourceController::class);
    Route::resource('data_source_data_type', DataSourceDataTypeController::class);
    Route::resource('display_option', DisplayOptionController::class);
    Route::resource('dna_sequence', DnaSequenceController::class);
    Route::resource('image_specimen', ImageSpecimenController::class);
    Route::resource('member_list_cluster', MemberListClusterController::class);
    Route::resource('member_list_group', MemberListGroupController::class);
    Route::resource('member_type', MemberTypeController::class);
    Route::resource('plant_association', PlantAssociationController::class);
    Route::resource('plant', PlantController::class);
    Route::resource('possible_match', PossibleMatchController::class);
    Route::resource('project_belongs_to', ProjectBelongToController::class);
    Route::resource('specimen_cluster', SpecimenClusterController::class);
    Route::resource('specimen_compare', SpecimenCompareController::class);
    Route::resource('specimen_group', SpecimenGroupController::class);
    Route::resource('synonym', SynonymController::class);
    Route::resource('tree', TreeController::class);

});
