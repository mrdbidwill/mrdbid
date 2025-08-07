Rails.application.routes.draw do
  # Devise user management routes
  devise_for :users, controllers: { sessions: 'users/sessions' }

  devise_scope :user do
    resource :two_factor_authentication, only: [ :show, :update ], controller: 'users/two_factor_authentication'
  end

  # Restrict resourceful routes for UsersController to avoid conflicts
  resources :users, only: [ :index, :new, :edit, :create, :update, :destroy ]

  resources :mushrooms do
    # Nested resources to handle related actions
    resources :all_group_mushrooms
    resources :cluster_mushrooms
    resources :image_mushrooms
  end

  # Expand routes
  resources :cluster_mushrooms, only: [:index, :show, :edit, :update, :destroy]
  resources :all_group_mushrooms, only: [:index, :show, :edit, :update, :destroy]
  resources :all_groups, only: %i[index show new create edit update destroy]
  resources :clusters, only: %i[index show new create edit update destroy]

  # Additional resource routes
  resources :permissions
  resources :roles
  resources :cameras
  resources :camera_models
  resources :camera_makes
  resources :colors
  resources :mr_characters
  resources :mushrooms
  resources :source_data

  # Static pages
  root 'pages#home'
  get 'contact', to: 'pages#contact'

  # Health check
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Add routes for image_mushrooms
  resources :image_mushrooms
end
