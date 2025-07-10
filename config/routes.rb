# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'

  # Publicly available pages
  get 'contact', to: 'pages#contact'

  devise_for :users

  resources :mr_characters
  resources :mushrooms
  resources :source_data

  get 'up' => 'rails/health#show', :as => :rails_health_check
end
