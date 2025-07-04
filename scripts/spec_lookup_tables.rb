# scripts to generate spec files
lookup_tables = %w[
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
  lamellae_attachments
  lamellae_breadths
  lamellae_context_flesh_latex_abundances
  lamellae_edges
  lamellae_spacings
  lamellae_thicknesses
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

lookup_tables.each do |table|
  class_name = table.singularize.camelize
  spec_file_path = "spec/models/lookup_tables/#{table.singularize}_spec.rb"

  if File.exist?(spec_file_path)
    puts "Skipped existing file: #{spec_file_path}"
  else
    File.open(spec_file_path, "w") do |file|
      file.puts <<~RUBY
        require 'rails_helper'

        RSpec.describe LookupTables::#{class_name}, type: :model do
          it_behaves_like 'a lookup table'
        end
      RUBY
    end
    puts "Created spec file: #{spec_file_path}"
  end
end
