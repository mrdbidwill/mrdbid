# scripts/generate_lookup_table_migrations.rb
require "fileutils"
require "active_support/core_ext/string"

lookup_tables = %i[
  abundances
  all_groups
  annulus_positions
  bulb_types
  camera_makes
  camera_models
  chem_reactions
  clusters
  countries
  display_options
  epithets
  fungus_types
  habitats
  habits
  lamella_attachments
  lamella_breadths
  lamella_context_flesh_latex_abundances
  lamella_edges
  lamella_spacings
  lamella_thicknesses
  mushroom_ages
  mushroom_storage_locations
  mycelium_textures
  odors
  partial_inner_veil_annular_ring_positions
  partial_inner_veil_appearances
  partial_inner_veil_fates
  partial_inner_veil_textures
  parts
  permissions
  pileus_context_flesh_textures
  pileus_margin_shapes
  pileus_margin_types
  pileus_shape_top_views
  pileus_shapes
  pileus_surface_drynesses
  pileus_surface_textures
  plants
  possible_matches
  preservation_methods
  project_belongs_tos
  rhizomorph_textures
  soil_types
  source_data_types
  stipe_interiors
  stipe_locations
  stipe_shapes
  stipe_surfaces
  stipe_textures
  synonyms
  tastes
  toxics
  trees
  universal_outer_veil_appearances
  universal_outer_veil_fates
  universal_outer_veil_textures
  veils
]

timestamp = Time.now.strftime("%Y%m%d%H%M%S")
migration_dir = "db/migrate"

lookup_tables.each_with_index do |table_name, index|
  # Generate a migration file name
  file_name = "#{timestamp.succ!.to_i}_create_#{table_name}.rb"
  file_path = File.join(migration_dir, file_name)

  # Define table structure
  content = <<~RUBY
    class Create#{table_name.to_s.camelize.pluralize} < ActiveRecord::Migration[8.0]
      def change
        return if table_exists?(:#{table_name})

        create_table :#{table_name} do |t|
          t.string :name, null: false
          t.text :description
          t.text :comments
          t.integer :source, null: false
          t.timestamps
        end
      end
    end
  RUBY

  # Create the migration file
  File.write(file_path, content)
  puts "Generated migration: #{file_path}"
end
