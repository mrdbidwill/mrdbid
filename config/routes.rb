Rails.application.routes.draw do
  root "pages#home"

  # Publicly available pages
  get "contact", to: "pages#contact"

  devise_for :users

  # Other resources
  resources :all_group_mushrooms
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

  # - dynamically map all lookup table routes to the single LookupTablesController
  LookupTableConstants::LOOKUP_TABLES.each do |table_name|
    resources table_name, controller: "lookup_tables"
  end

  get "up" => "rails/health#show", :as => :rails_health_check
end
