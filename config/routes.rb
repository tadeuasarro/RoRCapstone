# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts, only: [:index]
  resources :sessions, only: [:new, :create, :destroy]
end
