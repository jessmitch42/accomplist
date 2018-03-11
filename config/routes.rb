Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :lists do
    resources :items # to get items ~*~RESTfully~*~
  end

  get "/lists/:id/get_list", to: "lists#get_list"
  get '/lists/:id/show_js', to: 'lists#show_js'

  get '/your-tags', to: 'users#most_used_tags'
  get '/tags', to: 'tags#index'

  get '/about', to: 'static#about'
  # redirect random paths back home
  match '*path' => redirect('/'), via: :get
  root 'welcome#index'
end
