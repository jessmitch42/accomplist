Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :lists # to get /users/:id/lists/:id
  end

  get '/about', to: 'static#about'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
