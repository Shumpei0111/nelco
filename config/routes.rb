Rails.application.routes.draw do
  root to: "toppages#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new"
  resources :users, only: [:index, :show, :create] do
    member do
      get :followings
      get :followers
      get :favorites
    end
  end
  
  get "rankings/favorite", to: "rankings#favorite"
  
  get "terms-of-service", to: "policy#index"
  
  resources :nelcoposts, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
