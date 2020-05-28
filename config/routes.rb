# frozen_string_literal: true

Rails.application.routes.draw do
  resources :profiles
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#index'

  get 'about', to: 'pages#about'

  resources :posts
end
