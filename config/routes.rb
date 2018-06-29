Rails.application.routes.draw do
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  get "/welcome", to: "pages#welcome"
  get '/profile', to: 'profiles#show', as: 'profile'

  # client routes
  resources :bookings, only: [:new, :create]

  namespace :client do
     resources :bookings, only: [:show, :update, :index]
     resources :cars
  end

  # washer routes
  resources :bookings, only: [:show, :index, :update, :edit]
  namespace :washer do
    resources :bookings, only: [:index]
  end

  put 'bookings/:id/completed', to: "bookings#completed", as: 'completed'
end
