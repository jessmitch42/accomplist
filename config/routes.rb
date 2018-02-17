Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :lists do
    resources :items # to get items ~*~RESTfully~*~
  end

  resources :tags
  get '/about', to: 'static#about'
  # redirect random paths back home
  match '*path' => redirect('/'), via: :get
  root 'welcome#index'
end
