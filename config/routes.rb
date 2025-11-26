Rails.application.routes.draw do
  get "mushroom_search/index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  # Two-Factor Authentication routes
  namespace :users do
    resource :two_factor_settings, only: [] do
      post :enable
      post :verify
      delete :disable
    end
  end

  # 2FA login verification
  resource :user_two_factor_authentication, only: [:show, :update], controller: 'users/two_factor_authentication'

  # Mushrooms and related nested relationships
  resources :mushrooms do
    resources :image_mushrooms, only: [:new, :create, :edit, :update, :destroy]
    resources :mushroom_species, only: [:index, :new, :create, :destroy]
    resources :genus_mushrooms, only: [:index, :new, :create, :destroy]
    resources :comparisons, controller: 'mushroom_comparisons', only: [:index, :create], as: 'mushroom_comparisons'
    member do
      get 'export', to: 'mushrooms#export_pdf', as: :export_pdf, defaults: { format: :pdf }
      get 'edit_characters', to: 'mushrooms#edit_characters', as: :edit_characters
      post 'clone_characters', to: 'mushrooms#clone_characters', as: :clone_characters
    end
    collection do
      get 'export', to: 'mushrooms#export_pdf', as: :export_all_pdf, defaults: { format: :pdf }
    end
  end

  # Standalone comparison show route (not nested under mushroom)
  resources :mushroom_comparisons, only: [:show]

  # Generic resources
  resources :all_groups
  resources :all_group_mushrooms
  resources :articles, only: %i[index show]
  resources :books, only: [:index]
  resources :clusters
  resources :cluster_mushrooms
  resources :mr_character_mushrooms, only: [:create]
  resources :mushroom_trees, except: [:destroy]
  resources :mushroom_plants, except: [:destroy]
  resources :mushroom_projects
  resources :mushroom_species, except: [:destroy]
  resources :projects
  resources :genus_mushrooms, except: [:destroy]
  resources :states, only: [:index] # main use is for states in the dropdown

  # Expose public ImageMushrooms index/show to match controller
  resources :image_mushrooms


  # Admin-specific routes
  namespace :admin do
    root to: "dashboard#index"
    get 'database/export', to: 'database_exports#export', as: :database_export
    resources :admin_todos
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
    resources :observation_methods
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
    get 'trees_of_blakeley_signs', to: 'pages#trees_of_blakeley_signs'

  # Health check
  get 'up' => 'rails/health#show', as: :rails_health_check
  get "autocomplete/genera",        to: "autocomplete#genera",        as: :genera_autocomplete, defaults: { format: :json }
  get "autocomplete/species",       to: "autocomplete#species",       as: :species_autocomplete, defaults: { format: :json }
  get "autocomplete/trees",         to: "autocomplete#trees",         as: :trees_autocomplete, defaults: { format: :json }
  get "autocomplete/plants",        to: "autocomplete#plants",        as: :plants_autocomplete, defaults: { format: :json }
  get "autocomplete/mr_characters", to: "autocomplete#mr_characters", as: :mr_characters_autocomplete, defaults: { format: :json }

  resources :genus_mushrooms, only: [:create], defaults: { format: :json } do
    delete :destroy_by_relation, on: :collection, defaults: { format: :json }
  end
  resources :mushroom_species, only: [:create], defaults: { format: :json } do
    delete :destroy_by_relation, on: :collection, defaults: { format: :json }
  end
  resources :mushroom_trees, only: [:create], defaults: { format: :json } do
    delete :destroy_by_relation, on: :collection, defaults: { format: :json }
  end
  resources :mushroom_plants, only: [:create], defaults: { format: :json } do
    delete :destroy_by_relation, on: :collection, defaults: { format: :json }
  end
end
