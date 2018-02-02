Rails.application.routes.draw do
  root 'home#index'

<<<<<<< HEAD
  get '/auth/github/callback', to: "sessions#create"
=======
  get '/auth/github/callback', to: 'sessions#create'
>>>>>>> master

  resources :dashboard, only: [:index]
end
