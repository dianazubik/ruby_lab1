Rails.application.routes.draw do
  resources :conference_sessions
  devise_for :users
  get "pages/about"
  root "home#index"

  delete "users/destroy_all", to: "users#destroy_all", as: :destroy_all_users

  resources :users

  get "about", to: "pages#about", as: :about

  get "hi/index"
end