models = {
  "Abundance" => "name:string description:text comments:text source:references entered_by:references",
  "AnnulusPosition" => "name:string description:text comments:text source:references entered_by:references",
  "BulbType" => "name:string description:text comments:text source:references entered_by:references",
  "CapContextFleshTexture" => "name:string description:text comments:text source:references entered_by:references",
  "CapMarginShape" => "name:string description:text comments:text source:references entered_by:references",
  "CapMarginType" => "name:string description:text comments:text source:references entered_by:references",
  "CapShape" => "name:string description:text comments:text source:references entered_by:references",
  "CapShapeTopView" => "name:string description:text comments:text source:references entered_by:references",
  "CapSurfaceDryness" => "name:string description:text comments:text source:references entered_by:references",
  "CapSurfaceTexture" => "name:string description:text comments:text source:references entered_by:references",
  "ChemReaction" => "name:string description:text comments:text source:references entered_by:references",
  "Country" => "name:string description:text comments:text source:references entered_by:references",
  "Source" => "title:string author:string ref:string item_code:string comment:text my_rating:integer my_comment:text entered_by:references",
  "DisplayOption" => "name:string description:text comments:text source:references entered_by:references",
  "Epithet" => "name:string description:text comments:text source:references entered_by:references",
  "FungusType" => "name:string description:text comments:text source:references entered_by:references",
  "GillAttachment" => "name:string description:text comments:text source:references entered_by:references",
  "GillBreadth" => "name:string description:text comments:text source:references entered_by:references",
  "GillContextFleshLatexAbundance" => "name:string description:text comments:text source:references entered_by:references",
  "GillEdge" => "name:string description:text",
  "GillSpacing" => "name:string description:text comments:text source:references entered_by:references",
  "GillThickness" => "name:string description:text comments:text source:references entered_by:references",
  "Habit" => "name:string description:text comments:text source:references entered_by:references",
  "Odor" => "name:string description:text comments:text source:references entered_by:references",
  "PartialInnerVeilAppearance" => "name:string description:text comments:text source:references entered_by:references",
  "PartialInnerVeilFates" => "name:string description:text comments:text source:references entered_by:references",
  "PartialInnerVeilTextures" => "name:string description:text comments:text source:references entered_by:references",
  "PartialInnerVeilAnnularRingPosition" => "name:string description:text comments:text source:references entered_by:references",
  "Part" => "name:string description:text comments:text source:references entered_by:references",
  "PlantAssociation" => "name:string description:text comments:text source:references entered_by:references",
  "PossibleMatch" => "name:string description:text comments:text source:references entered_by:references",
  "PreservationMethod" => "name:string description:text comments:text source:references entered_by:references",
  "SoilType" => "name:string description:text comments:text source:references entered_by:references",
  "SpecimenAge" => "name:string description:text comments:text source:references entered_by:references",
  "State" => "name:string description:text comments:text source:references country:references entered_by:references",
  "StemInterior" => "name:string description:text comments:text source:references entered_by:references",
  "StemLocation" => "name:string description:text comments:text source:references entered_by:references",
  "StemShape" => "name:string description:text comments:text source:references entered_by:references",
  "StemSurface" => "name:string description:text comments:text source:references entered_by:references",
  "StemTexture" => "name:string description:text comments:text source:references entered_by:references",
  "Taste" => "name:string description:text comments:text source:references entered_by:references",
  "Toxic" => "name:string description:text comments:text source:references entered_by:references",
  "UniversalOuterVeilAppearance" => "name:string description:text comments:text source:references entered_by:references",
  "UniversalOuterVeilFate" => "name:string description:text comments:text source:references entered_by:references",
  "UniversalOuterVeilTexture" => "name:string description:text comments:text source:references entered_by:references",
  "Plant" => "name:string description:text comments:text source:references entered_by:references",
  "Synonym" => "name:string description:text comments:text source:references entered_by:references",
  "Veil" => "name:string description:text comments:text source:references entered_by:references",
  "DnaSequence" => "mushroom_id:string notes:text dna_barcode_its:text genbank_number_url:string genbank_accession_number:integer herbarium_catalog_number:string mycomap_blast_results:string provisional_species_name:string sequencing_technology:string trace_files_raw_dna_data voucher_number:string entered_by:references",
  "MyceliumTextures" => "name:string description:text comments:text source:references entered_by:references",
  "RhizomorphTexture" => "name:string description:text comments:text source:references entered_by:references"
}

models.each do |model, attributes|
  command = "bin/rails generate scaffold #{model} #{attributes}"
  puts "Running: #{command}"

  # Capture the output and result of the command
  success = system(command)

  # Check if the command executed successfully
  if success
    puts "Scaffold for #{model} generated successfully!"
  else
    puts "Error generating scaffold for #{model}. Please check the output."
  end


end
