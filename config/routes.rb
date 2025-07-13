# frozen_string_literal: true

Rails.application.routes.draw do
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