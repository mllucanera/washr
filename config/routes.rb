Rails.application.routes.draw do
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
#  get "/welcome", to: "pages#welcome"

  get '/welcome', to: 'washer_profiles#welcome'
  resources :washer_profiles, only: [:new, :create]

  get '/profile', to: 'profiles#show', as: 'profile'
  get '/bookings/mark_as_washing', to: 'bookings#mark_as_washing'
  get '/bookings/mark_as_washed', to: 'bookings#mark_as_washed'

  # client routes
  resources :bookings, only: [:new, :create]
  post '/client/bookings/confirm', to: 'bookings#confirm', as: 'client_booking_confirm'

  namespace :client do
     resources :bookings, only: [:show, :update, :index]
     resources :cars
  end

  # washer routes
  get '/bookings/history', to: 'bookings#washer_history', as: 'washer_bookings'
  resources :bookings, only: [:show, :index, :update, :edit]

  namespace :washer do
    resources :bookings, only: [:index]
  end

  put 'bookings/:id/completed', to: "bookings#completed", as: 'completed'
end
