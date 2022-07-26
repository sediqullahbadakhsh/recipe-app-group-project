# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: :index
  resources :foods
  resources :recipe_foods, expet: :update
  resources :recipes, expet: :update
  # Defines the root path route ("/")
  root 'users#index'
end
