Rails.application.routes.draw do
  root "sessions#new"

  resources :users, only: [:new, :create, :show]

  #sign in & sign out
  resource :sessions, only: [:new, :create, :destroy]
end
