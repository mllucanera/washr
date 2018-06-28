Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  get "/welcome", to: "pages#welcome"
   # client routes

  resources :bookings, only: [:new, :create]

  namespace :client do
    resources :bookings, only: [:show, :update]
    resources :cars
  end

  # washer routes

  resources :bookings, only: [:show, :index, :update, :edit]
  put 'bookings/:id/completed', to: "bookings#completed", as: 'completed'
end
