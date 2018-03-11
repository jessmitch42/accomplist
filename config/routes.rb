Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :lists do
    resources :items # to get items ~*~RESTfully~*~
  end

  get "/lists/:id/get_json", to: "lists#get_json"
  get '/tags', to: 'users#most_used_tags'
  get '/last-day-items', to: 'items#last_day_items'
  get '/about', to: 'static#about'
  # redirect random paths back home
  # match '*path' => redirect('/'), via: :get
  root 'welcome#index'
end
