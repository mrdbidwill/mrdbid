# spec/factories/lookup_factories.rb
lookup_tables = %i[
  abundances
  all_groups
  annulus_positions
  bulb_types
  camera_makes
  camera_models
  cap_context_flesh_textures
  cap_margin_shapes
  cap_margin_types
  cap_shape_top_views
  cap_shapes
  cap_surface_drynesses
  cap_surface_textures
  chem_reactions
  clusters
  countries
  display_options
  epithets
  fungus_types
  gill_attachments
  gill_breadths
  gill_context_flesh_latex_abundances
  gill_edges
  gill_spacings
  gill_thicknesses
  habitats
  habits
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
  plants
  possible_matches
  preservation_methods
  project_belongs_tos
  rhizomorph_textures
  soil_types
  source_data_types
  stem_interiors
  stem_locations
  stem_shapes
  stem_surfaces
  stem_textures
  synonyms
  tastes
  toxics
  trees
  universal_outer_veil_appearances
  universal_outer_veil_fates
  universal_outer_veil_textures
  veils
]

lookup_tables.each do |table_name|
  FactoryBot.define do
    factory table_name do
      name { "Sample #{table_name.to_s.titleize}" }
      description { "Description for #{table_name.to_s.titleize}" }
      comments { "Comments for #{table_name.to_s.titleize}" }
      association :source if Object.const_defined?("Source")
    end
  end
end
