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

  # Projects
  resources :projects

  # Clusters
  resources :clusters do
    resources :cluster_mushrooms, only: [:create, :destroy]
  end

  # Provide top-level access for ClusterMushrooms (explicit alias)
  resources :cluster_mushrooms do
    collection do
      get :new # Non-standard helper to satisfy tests expecting new_cluster_mushrooms_path
    end
  end
  get 'cluster_mushrooms/new', to: 'cluster_mushrooms#new_collection', as: :new_cluster_mushrooms

  # Genus and Species
  resources :genera, only: [:index, :show]
  resources :species, only: [:index, :show]

  # Image Mushrooms with both nested and top-level routes
  resources :image_mushrooms, only: [:index, :show]

  # MbLists as Independent Resources
  resources :mb_lists, only: [:index]

  # Generic resources
  resources :all_group_mushrooms
  get 'all_group_mushrooms/new', to: 'all_group_mushrooms#new'

  # Static pages
  root 'pages#home'
  get 'contact', to: 'pages#contact'

  # Admin-specific routes
  namespace :admin do
    # Top-level routes for managing mr_characters globally (admin-only functionality)
    resources :mr_characters
    resources :permissions
    resources :roles
    resources :cameras
    resources :camera_models
    resources :camera_makes
    resources :source_data
  end

  # Health check
  get 'up' => 'rails/health#show', as: :rails_health_check
end