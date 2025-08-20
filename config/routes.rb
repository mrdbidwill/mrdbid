Rails.application.routes.draw do
  devise_for :users

  # Mushrooms and related nested relationships
  resources :mushrooms do
    resources :image_mushrooms, only: [:new, :create, :edit, :update, :destroy]
    resources :mr_characters, only: [:index, :show] # Specifically tied to mushrooms
    resources :mushroom_projects, only: [:create, :destroy]
    resources :mushroom_species, only: [:index, :new, :create, :destroy]
    resources :genus_mushrooms, only: [:index, :new, :create, :destroy]
  end

  # Generic resources
  resources :all_groups
  resources :all_group_mushrooms
  resources :clusters
  resources :cluster_mushrooms
  resources :mushroom_trees
  resources :mushroom_plants
  resources :mushroom_projects
  resources :mushroom_species
  resources :genus_mushrooms

  # Admin-specific routes
  namespace :admin do
    resources :colors
    resources :countries
    resources :cameras
    resources :camera_models
    resources :camera_makes
    resources :display_options
    resources :fungus_types
    resources :genera
    resources :image_mushrooms
    resources :lookup_items
    resources :lookup_tables
    resources :lookup_types
    resources :mb_lists
    resources :mr_characters
    resources :parts
    resources :permissions
    resources :plants
    resources :projects
    resources :roles
    resources :source_data
    resources :source_data_types
    resources :storage_locations
    resources :species
    resources :states
    resources :trees
  end

    # Static pages
    root 'pages#home'
    get 'contact', to: 'pages#contact'

  # Health check
  get 'up' => 'rails/health#show', as: :rails_health_check
end
