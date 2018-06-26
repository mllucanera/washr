Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # washer routes

  resources :bookings, only: [:show, :index, :update, :edit]

  # client routes

  resources :bookings, only: [:new, :create]

  namespace :client do
    resources :cars
  end
end
