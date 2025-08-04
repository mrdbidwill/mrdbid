Rails.application.routes.draw do
  # Devise user management routes
  devise_for :users, controllers: { sessions: 'users/sessions' }

  devise_scope :user do
    resource :two_factor_authentication, only: [ :show, :update ], controller: 'users/two_factor_authentication'
  end

  # Restrict resourceful routes for UsersController to avoid conflicts
  resources :users, only: [ :index, :new, :edit, :create, :update, :destroy ]

  # Additional resource routes
  resources :all_groups
  resources :clusters
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
end
