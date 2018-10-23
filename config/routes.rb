Rails.application.routes.draw do
  get "/users/:id/main_page", to: 'users#main_page'

  resources :passenger_rides
  resources :reviews
  resources :rides
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
