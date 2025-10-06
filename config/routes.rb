Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: 'users/registrations'
}

  # Mushrooms and related nested relationships
  resources :mushrooms do
    resources :image_mushrooms, only: [:new, :create, :edit, :update, :destroy]
    resources :mushroom_species, only: [:index, :new, :create, :destroy]
    resources :genus_mushrooms, only: [:index, :new, :create, :destroy]
  end

  # Generic resources
  resources :all_groups
  resources :all_group_mushrooms
  resources :articles, only: %i[index show]
  resources :clusters
  resources :cluster_mushrooms
  resources :mr_character_mushrooms, only: [:create]
  resources :mushroom_trees
  resources :mushroom_plants
  resources :mushroom_projects
  resources :mushroom_species
  resources :projects
  resources :genus_mushrooms
  resources :states, only: [:index] # main use is for states in the dropdown

  # Expose public ImageMushrooms index/show to match controller
  resources :image_mushrooms


  # Admin-specific routes
  namespace :admin do
    root to: "dashboard#index"
    resources :articles
    resources :colors
    resources :countries
    resources :display_options
    resources :dna_sequences
    resources :fungus_types
    resources :genera
    resources :image_mushrooms
    resources :lenses
    resources :lookup_items
    resources :lookup_tables
    resources :lookup_types
    resources :mb_lists
    resources :mr_characters
    resource  :mr_characters_source, only: :show
    resources :parts
    resources :permissions
    resources :plants
    resources :roles
    resources :source_data
    resources :source_data_types
    resources :storage_locations
    resources :species
    resources :states
    resources :trees
    resources :lookup_items do
      member do
        get :versions
      end
    end
    resources :mr_characters do
      member do
        get :versions
      end
    end
  end

  get  "/contact", to: "contacts#new"
  post "/contact", to: "contacts#create"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # Static pages
    root 'pages#home'

  # Health check
  get 'up' => 'rails/health#show', as: :rails_health_check
  get "autocomplete/genera",  to: "autocomplete#genera",  as: :genera_autocomplete, defaults: { format: :json }
  get "autocomplete/species", to: "autocomplete#species", as: :species_autocomplete, defaults: { format: :json }

  resources :genus_mushrooms, only: [:create], defaults: { format: :json } do
    delete :destroy_by_relation, on: :collection
  end
  resources :mushroom_species, only: [:create], defaults: { format: :json } do
    delete :destroy_by_relation, on: :collection
  end
end
