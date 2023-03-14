# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #Recipes List
  get 'recipes', to: 'recipes#index'
  get 'recipes/:id', to: 'recipes#show'
  patch 'recipes/:id', to: 'recipes#update'
  delete 'recipes/:id', to: 'recipes#destroy'

  # General Shopping List
  get 'general_shopping_list', to: 'general_shopping#index'
end
