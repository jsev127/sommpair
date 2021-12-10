Rails.application.routes.draw do
  resources :wines
  devise_for :user_profiles
  resources :user_profiles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
