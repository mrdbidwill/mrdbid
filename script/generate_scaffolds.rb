# Load the Rails environment so the script can access ActiveRecord and other Rails components
require_relative "../config/environment"

# Step 0: Recreate the database
puts "Dropping and recreating the database..."
system("bin/rails db:drop db:create")

# Step 1: Generate and migrate the Role model
puts "Setting up Role model..."
if ActiveRecord::Base.connection.table_exists?(:roles)
  puts "Table 'roles' already exists. Skipping migration."
else
  system("bin/rails generate scaffold Role name:string description:text comments:text --skip-references")
  system("bin/rails db:migrate")
end

# Step 2: Generate and migrate Devise User
puts "Setting up Devise for User model..."
system("bin/rails generate devise User")
system("bin/rails db:migrate")

# Step 3: Add the role_id reference to the user table
puts "Adding role to User..."
if ActiveRecord::Base.connection.column_exists?(:users, :role_id)
  puts "The column 'role_id' already exists in 'users'. Skipping migration."
else
  migration_status = `bin/rails generate migration AddRoleToUsers role:references`
  if migration_status.include?("already named")
    puts "Warning: Migration 'AddRoleToUsers' already exists. Skipping generation."
  else
    puts migration_status
  end
  system("bin/rails db:migrate")
end

# Step 4: Generate other scaffolds
models = {
  "Source" => "title:string author:string ref:string item_code:string comment:text my_rating:integer my_comment:text",
  "CameraMake" => "name:string description:text comments:text source:references",
  "DisplayOption" => "name:string description:text comments:text source:references",
  "Lens" => "make:string model:string description:text comments:text source:references --force-plural",
  "Country" => "name:string description:text comments:text source:references",
  "State" => "name:string description:text comments:text source:references country:references",
  "FungusType" => "name:string description:text comments:text source:references",
  "MushroomStorageLocation" => "name:string description:text comments:text source:references",
  "Part" => "name:string description:text comments:text source:references",
  "Mushroom" => "mushroom_name:string description:text state:references country:references fungus_type:references mushroom_storage_location:references",
  "ImageMushroom" => "mushroom:references parts:references image_name:string image_file_address:string image_width:integer image_height:integer camera_make:references camera_model:string lens:string exposure:string aperture:string iso:string",
  "ImageMushroomThumbnail" => "image_mushroom:references thumbnail_file_address:string image_width:integer image_height:integer",
  "MrCharacter" => "name:string display_option:references part:references source:references",
  "Abundance" => "name:string description:text comments:text source:references",
  "AllGroup" => "name:string description:text comments:text source:references",
  "AllGroupMushroom" => "all_group:references mushroom:references",
  "AnnulusPosition" => "name:string description:text comments:text source:references",
  "Article" => "title:string author:string ref:string item_code:string comment:text my_rating:integer my_comment:text",
  "BulbType" => "name:string description:text comments:text source:references",
  "CameraModel" => "name:string description:text comments:text source:references",
  "Camera" => "name:string description:text comments:text camera_makes:references camera_models:references lens:references",
  "CapContextFleshTexture" => "name:string description:text comments:text source:references",
  "CapMarginShape" => "name:string description:text comments:text source:references",
  "CapMarginType" => "name:string description:text comments:text source:references",
  "CapShape" => "name:string description:text comments:text source:references",
  "CapShapeTopView" => "name:string description:text comments:text source:references",
  "CapSurfaceDryness" => "name:string description:text comments:text source:references",
  "CapSurfaceTexture" => "name:string description:text comments:text source:references",
  "ChemReaction" => "name:string description:text comments:text source:references",
  "Cluster" => "name:string description:text comments:text source:references",
  "ClusterMushroom" => "cluster:references mushroom:references",
  "Color" => "latin_name:string common_name:string color_group:integer hex:string sequence_number:integer r_val:integer g_val:integer b_val:integer closest_websafe_color:string cwc_r:integer cwc_g:integer cwc_b:integer image_file:string",
  "DnaSequence" => "mushroom_id:string notes:text dna_barcode_its:text genbank_number_url:string genbank_accession_number:string herbarium_catalog_number:string mycomap_blast_results:string provisional_species_name:string sequencing_technology:string trace_files_raw_dna_data voucher_number:string",
  "Epithet" => "name:string description:text comments:text source:references",
  "GillAttachment" => "name:string description:text comments:text source:references",
  "GillBreadth" => "name:string description:text comments:text source:references",
  "GillContextFleshLatexAbundance" => "name:string description:text comments:text source:references",
  "GillEdge" => "name:string description:text comments:text source:references",
  "GillSpacing" => "name:string description:text comments:text source:references",
  "GillThickness" => "name:string description:text comments:text source:references",
  "Habit" => "name:string description:text comments:text source:references",
  "Habitat" => "name:string description:text comments:text source:references",
  "MushroomAge" => "name:string description:text comments:text source:references",
  "MrCharacterMushroom" => "mr_character:references mushroom:references character_value:string",
  "MyceliumTexture" => "name:string description:text comments:text source:references",
  "Odor" => "name:string description:text comments:text source:references",
  "PartialInnerVeilAppearance" => "name:string description:text comments:text source:references",
  "PartialInnerVeilFate" => "name:string description:text comments:text source:references",
  "PartialInnerVeilTexture" => "name:string description:text comments:text source:references",
  "PartialInnerVeilAnnularRingPosition" => "name:string description:text comments:text source:references",
  "Permission" => "name:string description:text comments:text source:references",
  "Plant" => "name:string description:text comments:text source:references",
  "PlantAssociation" => "mushroom:references plant:references",
  "PossibleMatch" => "name:string description:text comments:text source:references",
  "PreservationMethod" => "name:string description:text comments:text source:references",
  "ProjectBelongsTo" => "name:string description:text comments:text source:references",
  "RhizomorphTexture" => "name:string description:text comments:text source:references",
  "SoilType" => "name:string description:text comments:text source:references",
  "SourceDataType" => "name:string description:text comments:text source:references",
  "StemInterior" => "name:string description:text comments:text source:references",
  "StemLocation" => "name:string description:text comments:text source:references",
  "StemShape" => "name:string description:text comments:text source:references",
  "StemSurface" => "name:string description:text comments:text source:references",
  "StemTexture" => "name:string description:text comments:text source:references",
  "Synonym" => "name:string description:text comments:text source:references",
  "Taste" => "name:string description:text comments:text source:references",
  "Toxic" => "name:string description:text comments:text source:references",
  "Tree" => "name:string description:text comments:text source:references",
  "TreeAssociation" => "mushroom:references tree:references",
  "UniversalOuterVeilAppearance" => "name:string description:text comments:text source:references",
  "UniversalOuterVeilFate" => "name:string description:text comments:text source:references",
  "UniversalOuterVeilTexture" => "name:string description:text comments:text source:references",
  "Veil" => "name:string description:text comments:text source:references"
}

models.each do |model, attributes|
  puts "Generating scaffold for #{model}..."
  command = "bin/rails generate scaffold #{model} #{attributes}"
  system(command)
end

puts "All scaffolds have been generated successfully!"
