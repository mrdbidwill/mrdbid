<?php

use App\Http\Controllers\Admin\AdminCharacterController;
use App\Http\Controllers\Admin\AdminExportDatabaseController;
use App\Http\Controllers\Admin\AdminLookUpTableController;
use App\Http\Controllers\Admin\AdminSpecimenController;
use App\Http\Controllers\CharacterController;
use App\Http\Controllers\CharacterSpecimenController;
use App\Http\Controllers\DataImageSourceController;
use App\Http\Controllers\DataSourceController;
use App\Http\Controllers\DataSourceDataTypeController;
use App\Http\Controllers\DisplayOptionController;
use App\Http\Controllers\DnaSequenceController;
use App\Http\Controllers\ImageSpecimenController;
use App\Http\Controllers\Lookup\AbundanceController;
use App\Http\Controllers\Lookup\AnnulusPositionController;
use App\Http\Controllers\Lookup\BulbTypeController;
use App\Http\Controllers\Lookup\CapContextFleshController;
use App\Http\Controllers\Lookup\CapMarginShapeController;
use App\Http\Controllers\Lookup\CapMarginTypeController;
use App\Http\Controllers\Lookup\CapShapeController;
use App\Http\Controllers\Lookup\CapShapeTopViewController;
use App\Http\Controllers\Lookup\CapSurfaceDrynessController;
use App\Http\Controllers\Lookup\CapSurfaceTextureController;
use App\Http\Controllers\Lookup\ChemReactionController;
use App\Http\Controllers\Lookup\CountryController;
use App\Http\Controllers\Lookup\EpithetController;
use App\Http\Controllers\Lookup\FungusTypeController;
use App\Http\Controllers\Lookup\GenusController;
use App\Http\Controllers\Lookup\GillAttachmentController;
use App\Http\Controllers\Lookup\GillBreadthController;
use App\Http\Controllers\Lookup\GillConFleshLatexAbunController;
use App\Http\Controllers\Lookup\GillEdgeController;
use App\Http\Controllers\Lookup\GillOtherController;
use App\Http\Controllers\Lookup\GillSpacingController;
use App\Http\Controllers\Lookup\GillThicknessController;
use App\Http\Controllers\Lookup\HabitatController;
use App\Http\Controllers\Lookup\HabitController;
use App\Http\Controllers\Lookup\LensController;
use App\Http\Controllers\Lookup\OdorController;
use App\Http\Controllers\Lookup\PartController;
use App\Http\Controllers\Lookup\PartialInnerVeilAppearanceController;
use App\Http\Controllers\Lookup\PartialInnerVeilFateController;
use App\Http\Controllers\Lookup\PartialInnerVeilTextureController;
use App\Http\Controllers\Lookup\PartInVeilAnnRiPositController;
use App\Http\Controllers\Lookup\PreservationMethodController;
use App\Http\Controllers\Lookup\SoilTypeController;
use App\Http\Controllers\Lookup\SpeciesController;
use App\Http\Controllers\Lookup\SpecimenAgeController;
use App\Http\Controllers\Lookup\SpecimenLocationNowController;
use App\Http\Controllers\Lookup\StateController;
use App\Http\Controllers\Lookup\StemInteriorController;
use App\Http\Controllers\Lookup\StemLocationController;
use App\Http\Controllers\Lookup\StemShapeController;
use App\Http\Controllers\Lookup\StemSurfaceController;
use App\Http\Controllers\Lookup\StemTextureController;
use App\Http\Controllers\Lookup\TasteController;
use App\Http\Controllers\Lookup\ToxicController;
use App\Http\Controllers\Lookup\UnivOutVeilAppearController;
use App\Http\Controllers\Lookup\UnivOutVeilFateController;
use App\Http\Controllers\Lookup\UnivOutVeilTextureController;
use App\Http\Controllers\Lookup\VeilController;
use App\Http\Controllers\MemberListClusterController;
use App\Http\Controllers\MemberListGroupController;
use App\Http\Controllers\MemberTypeController;
use App\Http\Controllers\PlantAssociationController;
use App\Http\Controllers\PlantController;
use App\Http\Controllers\PossibleMatchController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ProjectBelongToController;
use App\Http\Controllers\SpecimenClusterController;
use App\Http\Controllers\SpecimenCompareController;
use App\Http\Controllers\SpecimenController;
use App\Http\Controllers\SpecimenGroupController;
use App\Http\Controllers\SynonymController;
use App\Http\Controllers\TreeController;
use Illuminate\Support\Facades\Route;

Route::get('specimens/dashboard', [SpecimenController::class, 'dashboard'])->name('specimens.dashboard')->middleware('auth');

Route::view('admin/dashboard', 'admin.dashboard')->name('admin_dashboard')->middleware('auth');

Route::get('/admin/admin_export_database', [AdminExportDatabaseController::class, 'index'])->name('admin.exportDatabase.index')->middleware('auth');

Route::get('/admin/exportDatabase', [AdminExportDatabaseController::class, 'exportDatabase'])->name('admin.exportDatabase')->middleware('auth');

Route::get('/admin/saveDatabaseToLocalFile', [AdminExportDatabaseController::class, 'saveDatabaseToLocalFile'])->name('admin.saveDatabaseToLocalFile')->middleware('auth');

Route::view('/', 'home')->name('home');
Route::view('/contact', 'contact')->name('contact');
Route::view('/about', 'about')->name('about');

Route::get('/get-states/{countryId}', [SpecimenController::class, 'getStates']);

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    Route::resource('specimens', SpecimenController::class);
    Route::resource('characters', CharacterController::class);
    Route::resource('character_specimens', CharacterSpecimenController::class);

    Route::resource('admin_character_table', AdminCharacterController::class);
    Route::resource('admin_lookup_table', AdminLookUpTableController::class);
    Route::resource('admin_specimen_table', AdminSpecimenController::class);

    Route::resource('abundance', AbundanceController::class);
    Route::resource('annulus_position', AnnulusPositionController::class);
    Route::resource('bulb_type', BulbTypeController::class);
    Route::resource('cap_context_flesh', CapContextFleshController::class);
    Route::resource('cap_margin_shape', CapMarginShapeController::class);
    Route::resource('cap_margin_type', CapMarginTypeController::class);
    Route::resource('cap_shape', CapShapeController::class);
    Route::resource('cap_shape_top', CapShapeTopViewController::class);
    Route::resource('cap_surface_dryness', CapSurfaceDrynessController::class);
    Route::resource('cap_surface_texture', CapSurfaceTextureController::class);
    Route::resource('chem_reaction', ChemReactionController::class);
    Route::resource('country', CountryController::class);
    Route::resource('data_image_source', DataImageSourceController::class);
    Route::resource('data_source', DataSourceController::class);
    Route::resource('data_source_data_type', DataSourceDataTypeController::class);
    Route::resource('display_option', DisplayOptionController::class);
    Route::resource('dna_sequence', DnaSequenceController::class);
    Route::resource('epithet', EpithetController::class);
    Route::resource('fungus_type', FungusTypeController::class);
    Route::resource('genus', GenusController::class);
    Route::resource('gill_attachment', GillAttachmentController::class);
    Route::resource('gill_breadth', GillBreadthController::class);
    Route::resource('gill_con_flesh_latex_abun', GillConFleshLatexAbunController::class);
    Route::resource('gill_edge', GillEdgeController::class);
    Route::resource('gill_other', GillOtherController::class);
    Route::resource('gill_spacing', GillSpacingController::class);
    Route::resource('gill_thickness', GillThicknessController::class);
    Route::resource('habitat', HabitatController::class);
    Route::resource('habit', HabitController::class);
    Route::resource('image_specimen', ImageSpecimenController::class);
    Route::resource('lens', LensController::class);
    Route::resource('member_list_cluster', MemberListClusterController::class);
    Route::resource('member_list_group', MemberListGroupController::class);
    Route::resource('member_type', MemberTypeController::class);
    Route::resource('odor', OdorController::class);
    Route::resource('part', PartController::class);
    Route::resource('part_in_veil_ann_ri_position', PartInVeilAnnRiPositController::class);
    Route::resource('partial_inner_veil_appearance', PartialInnerVeilAppearanceController::class);
    Route::resource('partial_inner_veil_fate', PartialInnerVeilFateController::class);
    Route::resource('partial_inner_veil_texture', PartialInnerVeilTextureController::class);
    Route::resource('plant_association', PlantAssociationController::class);
    Route::resource('plant', PlantController::class);
    Route::resource('possible_match', PossibleMatchController::class);
    Route::resource('preservation_method', PreservationMethodController::class);
    Route::resource('project_belongs_to', ProjectBelongToController::class);
    Route::resource('soil_type', SoilTypeController::class);
    Route::resource('species', SpeciesController::class);
    Route::resource('specimen_age', SpecimenAgeController::class);
    Route::resource('specimen_cluster', SpecimenClusterController::class);
    Route::resource('specimen_compare', SpecimenCompareController::class);
    Route::resource('specimen_group', SpecimenGroupController::class);
    Route::resource('specimen_location_now', SpecimenLocationNowController::class);
    Route::resource('state', StateController::class);
    Route::resource('stem_interior', StemInteriorController::class);
    Route::resource('stem_location', StemLocationController::class);
    Route::resource('stem_shape', StemShapeController::class);
    Route::resource('stem_surface', StemSurfaceController::class);
    Route::resource('stem_texture', StemTextureController::class);
    Route::resource('synonym', SynonymController::class);
    Route::resource('taste', TasteController::class);
    Route::resource('toxic', ToxicController::class);
    Route::resource('tree', TreeController::class);
    Route::resource('universal_outer_veil_appearance', UnivOutVeilAppearController::class);
    Route::resource('universal_outer_veil_fate', UnivOutVeilFateController::class);
    Route::resource('universal_outer_veil_texture', UnivOutVeilTextureController::class);
    Route::resource('veil', VeilController::class);

    Route::get('get-states', [SpecimenController::class, 'getStates'])->name('getStates');

});

Route::get('phpmyinfo', function () {
    phpinfo();
})->name('phpmyinfo');

require __DIR__.'/auth.php';
