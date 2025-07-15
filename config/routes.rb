# frozen_string_literal: true

Rails.application.routes.draw do
  get "tree_associations/index"
  get "tree_associations/show"
  get "tree_associations/new"
  get "tree_associations/create"
  get "tree_associations/edit"
  get "tree_associations/update"
  get "tree_associations/destroy"
  get "plant_associations/index"
  get "plant_associations/show"
  get "plant_associations/new"
  get "plant_associations/create"
  get "plant_associations/edit"
  get "plant_associations/update"
  get "plant_associations/destroy"
  get "lens/index"
  get "lens/show"
  get "lens/new"
  get "lens/create"
  get "lens/edit"
  get "lens/update"
  get "lens/destroy"
  get "image_mushroom_thumbnails/index"
  get "image_mushroom_thumbnails/show"
  get "image_mushroom_thumbnails/new"
  get "image_mushroom_thumbnails/create"
  get "image_mushroom_thumbnails/edit"
  get "image_mushroom_thumbnails/update"
  get "image_mushroom_thumbnails/destroy"
  get "image_mushrooms/index"
  get "image_mushrooms/show"
  get "image_mushrooms/new"
  get "image_mushrooms/create"
  get "image_mushrooms/edit"
  get "image_mushrooms/update"
  get "image_mushrooms/destroy"
  get "dna_sequences/index"
  get "dna_sequences/show"
  get "dna_sequences/new"
  get "dna_sequences/create"
  get "dna_sequences/edit"
  get "dna_sequences/update"
  get "dna_sequences/destroy"
  get "cluster_mushrooms/index"
  get "cluster_mushrooms/show"
  get "cluster_mushrooms/new"
  get "cluster_mushrooms/create"
  get "cluster_mushrooms/edit"
  get "cluster_mushrooms/update"
  get "cluster_mushrooms/destroy"
  get "all_group_mushrooms/index"
  get "all_group_mushrooms/show"
  get "all_group_mushrooms/new"
  get "all_group_mushrooms/create"
  get "all_group_mushrooms/edit"
  get "all_group_mushrooms/update"
  get "all_group_mushrooms/destroy"
  resources :permissions
  resources :roles
  resources :cameras
  resources :camera_models
  resources :camera_makes
  resources :colors
  root 'pages#home'

  # Publicly available pages
  get 'contact', to: 'pages#contact'

  devise_for :users, controllers: { sessions: 'users/sessions' }

  devise_scope :user do
    resource :two_factor_authentication, only: [:show, :update], controller: 'users/two_factor_authentication'
  end

  resources :mr_characters
  resources :mushrooms
  resources :source_data

  get 'up' => 'rails/health#show', :as => :rails_health_check
end