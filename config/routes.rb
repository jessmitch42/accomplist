Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :lists, only: [:show, :index] # to get /users/:id/lists/:id
    resources :tags # to get tags user has used ~*~RESTfully~*~
  end

  resources :list_items, only: [:new, :create]

  get '/about', to: 'static#about'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
