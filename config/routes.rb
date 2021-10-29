Rails.application.routes.draw do
  root "sessions#new"

  #sign up & show
  resources :users, only: [:new, :create, :show] do 
    resource :overview, only: [:show]
    resources :messages, only: [:create, :index]
  end

  #sign in & sign out
  resource :sessions, only: [:new, :create, :destroy]
end
