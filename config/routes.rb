Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "wines#index"
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
