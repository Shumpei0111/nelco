Rails.application.routes.draw do
  root to: "toppages#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new"
  get "icon_upload", to: "users#edit"
  resources :users, only: [:index, :show, :create, :edit, :update] do
    member do
      get :followings
      get :followers
      get :favorites
    end
  end
  
  get "rankings/favorite", to: "rankings#favorite"
  
  get "terms-of-service", to: "policy#index"
  
  get "allposts", to: "allposts#index"
  
  resources :nelcoposts, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
