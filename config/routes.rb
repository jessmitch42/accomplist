Rails.application.routes.draw do
  devise_for :users

  resources :lists do # to get /users/:id/lists/:id
    resources :items
    resources :tags # to get tags user has used ~*~RESTfully~*~
  end

  get '/about', to: 'static#about'

  # redirect random paths back home
  match '*path' => redirect('/'), via: :get
  
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
