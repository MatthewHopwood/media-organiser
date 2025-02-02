Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "playlists#index"
  resources :media_categories
  resources :media_files
  resources :media_types
  resources :images
  resources :playlists, except: :index
end
