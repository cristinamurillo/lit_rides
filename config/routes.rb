Rails.application.routes.draw do
  get "/users/:id/past_rides", to: 'users#past_rides', as: 'past_rides'
  get "/users/:id/past_drives", to: 'users#past_drives', as: 'past_drives'
  get "/users/:id/main_page", to: 'users#main_page'

  get "/rides/:id/travelers", to: 'rides#travelers'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/users/:id/account', to: 'users#account', as: 'account'

  root to: 'users#welcome'

  get '/apply', to: 'rides#apply', as: 'apply'
  post '/add_passenger', to: 'rides#add_passenger', as: 'add_passenger'


  resources :passenger_rides
  resources :reviews
  resources :rides
  resources :users
  resources :sessions, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
