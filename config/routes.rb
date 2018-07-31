Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get  '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      post :authorize, :unauthorize, :forbidden, :unforbidden
      get :likes, :keeps, :follows, :following, :followers
    end
    get 'search', on: :collection
  end
  root 'welcomes#index'
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :password_alters,     only: [:edit, :update]
  resources :portraits,           only: [:new, :create, :update]
  resources :articles do
    collection do
      delete :remove_select, :all_unrelease, :all_release, :close_all_comments, :open_all_comments
    end
    member do
      get :release, :unrelease, :comments_set, :open_comments, :close_comments
    end
  end
  get 'articles_search', to: "welcomes#articles_search"
  resources :categories
  resources :comments
  resources :notifications do
    get 'read', on: :collection
    get 'remove', on: :collection
  end
  resources :tags
  resources :pictures, only: [:create]
  resources :likes, only: [:create, :destroy]
  resources :follows, only: [:create, :destroy]
  resources :keeps, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
