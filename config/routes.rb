Rails.application.routes.draw do
  root "pages#home"

  # Publicly available pages
  get "contact", to: "pages#contact"

  devise_for :users

  # Other resources
  resources :all_group_mushrooms
  resources :articles
  resources :cameras
  resources :colors
  resources :cluster_mushrooms
  resources :dna_sequences
  resources :image_mushroom_thumbnails
  resources :image_mushrooms
  resources :lens
  resources :mr_character_mushrooms
  resources :mr_characters
  resources :mushrooms
  resources :plant_associations
  resources :roles
  resources :sources
  resources :states
  resources :tree_associations

  # Lookup table namespace
  namespace :lookup_tables do
    resources :abundances, only: [:index]
    resources :all_groups
    resources :annulus_positions
    resources :bulb_types
    resources :camera_makes
    resources :camera_models
    resources :cap_surface_textures
    resources :cap_surface_drynesses
    resources :cap_shape_top_views
    resources :cap_shapes
    resources :cap_margin_types
    resources :cap_margin_shapes
    resources :cap_context_flesh_textures
    resources :chem_reactions
    resources :clusters
    resources :countries
    resources :display_options
    resources :epithets
    resources :fungus_types
    resources :gill_attachments
    resources :gill_breadths
    resources :gill_context_flesh_latex_abundances
    resources :gill_edges
    resources :gill_spacings
    resources :gill_thicknesses
    resources :habits
    resources :habitats
    resources :mushroom_ages
    resources :mushroom_storage_locations
    resources :mycelium_textures
    resources :odors
    resources :parts
    resources :partial_inner_veil_annular_ring_positions
    resources :partial_inner_veil_appearances
    resources :partial_inner_veil_fates
    resources :partial_inner_veil_textures
    resources :permissions
    resources :plants
    resources :possible_matches
    resources :preservation_methods
    resources :project_belongs_tos
    resources :rhizomorph_textures
    resources :soil_types
    resources :source_data_types
    resources :stem_interiors
    resources :stem_locations
    resources :stem_shapes
    resources :stem_surfaces
    resources :stem_textures
    resources :synonyms
    resources :tastes
    resources :toxics
    resources :trees
    resources :universal_outer_veil_textures
    resources :universal_outer_veil_fates
    resources :universal_outer_veil_appearances
    resources :veils
  end

  get "up" => "rails/health#show", :as => :rails_health_check
end
