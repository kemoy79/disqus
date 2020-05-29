# frozen_string_literal: true

Rails.application.routes.draw do
  resources :profiles
  
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end

    unauthenticated do
      root 'pages#index', as: :root
    end
  end

  get '/about', to: 'pages#about'
  resources :posts
end
