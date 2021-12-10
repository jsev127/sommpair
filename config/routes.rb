Rails.application.routes.draw do
  resources :reviews
  resources :bookmarks
  resources :categories
  resources :countries
  resources :regions
  resources :grape_varietals
  resources :wineries
  resources :wines
  devise_for :user_profiles
  resources :user_profiles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
