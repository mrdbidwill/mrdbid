Rails.application.routes.draw do
  # Devise user management routes
  devise_for :users, controllers: { sessions: 'users/sessions' }

  devise_scope :user do
    resource :two_factor_authentication, only: [:show, :update], controller: 'users/two_factor_authentication'
  end

  # Restrict resourceful routes for Users
  resources :users, only: [:index, :new, :edit, :create, :update, :destroy]

  # AllGroups with nested AllGroupMushrooms
  resources :all_groups, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :all_group_mushrooms, only: [:new, :create]
  end

  # Mushrooms with nested ClusterMushrooms, AllGroupMushrooms, and ImageMushrooms
  resources :mushrooms, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :cluster_mushrooms, only: [:new, :create]
    resources :all_group_mushrooms, only: [:new, :create]
    resources :image_mushrooms, only: [:new, :create]
  end

  # Clusters with nested ClusterMushrooms
  resources :clusters, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :cluster_mushrooms, only: [:index]
  end

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

