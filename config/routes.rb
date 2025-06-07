Rails.application.routes.draw do
  resources :mushroom_locations
  resources :project_belongs_tos
  resources :mr_character_mushrooms
  resources :cameras
  resources :lens
  resources :image_mushroom_thumbnails
  resources :image_mushrooms
  resources :source_data_types
  resources :colors
  resources :cluster_mushrooms
  resources :clusters
  resources :articles
  resources :all_group_mushrooms
  resources :all_groups
  resources :rhizomorph_textures
  resources :mycelium_textures
  resources :dna_sequences
  resources :veils
  resources :synonyms
  resources :plants
  resources :universal_outer_veil_textures
  resources :universal_outer_veil_fates
  resources :universal_outer_veil_appearances
  resources :toxics
  resources :tastes
  resources :stem_textures
  resources :stem_surfaces
  resources :stem_shapes
  resources :stem_locations
  resources :stem_interiors
  resources :states
  resources :specimen_ages
  resources :soil_types
  resources :preservation_methods
  resources :possible_matches
  resources :plant_associations
  resources :parts
  resources :partial_inner_veil_annular_ring_positions
  resources :partial_inner_veil_textures
  resources :partial_inner_veil_fates
  resources :partial_inner_veil_appearances
  resources :odors
  resources :habits
  resources :gill_thicknesses
  resources :gill_spacings
  resources :gill_edges
  resources :gill_context_flesh_latex_abundances
  resources :gill_breadths
  resources :gill_attachments
  resources :fungus_types
  resources :epithets
  resources :display_options
  resources :sources
  resources :countries
  resources :chem_reactions
  resources :cap_surface_textures
  resources :cap_surface_drynesses
  resources :cap_shape_top_views
  resources :cap_shapes
  resources :cap_margin_types
  resources :cap_margin_shapes
  resources :cap_context_flesh_textures
  resources :bulb_types
  resources :annulus_positions
  resources :abundances
  resources :mr_characters
  resources :mushrooms
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "mushrooms#index" # Or any other controller and action
end
