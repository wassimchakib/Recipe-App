# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#index"

  #Recipes List
  resources :recipes do
    resources :recipe_foods
    get 'general_shopping_list', to: 'general_shopping#index'
  end
end
