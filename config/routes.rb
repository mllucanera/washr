Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

   # client routes

  resources :bookings, only: [:new, :create]

  namespace :client do
    resources :cars
  end

  # washer routes

  resources :bookings, only: [:show, :index, :update, :edit]
end
