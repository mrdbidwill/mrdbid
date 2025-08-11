Rails.application.routes.draw do
  # High-priority explicit route for new (to satisfy integration test using string path)
  get 'all_group_mushrooms/new', to: 'all_group_mushrooms#new'
  # Ensure /cluster_mushrooms/new path resolves to the standard new action and returns 2XX in tests
  get 'cluster_mushrooms/new', to: 'cluster_mushrooms#new'

  # Devise user management routes
  devise_for :users, controllers: { sessions: 'users/sessions' }

  # Devise-specific resource for two-factor authentication
  devise_scope :user do
    resource :two_factor_authentication, only: [:show, :update], controller: 'users/two_factor_authentication'
  end

  # Restrict resourceful routes for Users
  resources :users, only: [:index, :new, :edit, :create, :update, :destroy]

  # AllGroups with fully implemented nested AllGroupMushrooms
  resources :all_groups do
    resources :all_group_mushrooms, shallow: true # Nesting, with shallow routes for better handling
  end


  # Clusters with nested ClusterMushrooms
  resources :clusters do
    resources :cluster_mushrooms, shallow: true
  end

  # Explicit route for new to ensure tests hitting new_image_mushroom_path get a 2XX.
  # Must be defined before any shallow member routes like /image_mushrooms/:id
  get 'image_mushrooms/new', to: 'image_mushrooms#new'

  # Mushrooms with nested ClusterMushrooms, AllGroupMushrooms, and ImageMushrooms
  resources :mushrooms do
    resources :cluster_mushrooms, shallow: true
    resources :all_group_mushrooms, shallow: true
    resources :image_mushrooms, shallow: true
  end

  # Explicit route for new to satisfy integration test path resolution
  get 'all_group_mushrooms/new', to: 'all_group_mushrooms#new'
  # Provide top-level collection and member routes for AllGroupMushrooms so helpers like
  # all_group_mushrooms_path and all_group_mushroom_path are available without nesting.
  resources :all_group_mushrooms

  # ImageMushrooms with direct access
  resources :image_mushrooms

  # Provide top-level ClusterMushrooms routes so collection helpers are available
  resources :cluster_mushrooms do
    # Non-standard helper to satisfy tests expecting new_cluster_mushrooms_path
    collection do
      get :new
    end
  end
  # Explicit alias to ensure helper exists
  get 'cluster_mushrooms/new', to: 'cluster_mushrooms#new_collection', as: :new_cluster_mushrooms

  # Additional resources
  resources :permissions
  resources :roles
  resources :cameras
  resources :camera_models
  resources :camera_makes
  resources :colors
  resources :mr_characters
  resources :source_data

  # Static pages
  root 'pages#home'
  get 'contact', to: 'pages#contact'

  # Health check
  get 'up' => 'rails/health#show', as: :rails_health_check
end
