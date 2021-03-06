# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'posts#index'

  resources :users, except: [:delete]
  resources :posts, only: [:index, :new, :create]
  resources :sessions, only: [:create, :destroy]
  resources :followings, only: [:create, :destroy]

  get '/login', action: 'new', controller: 'sessions'
end
