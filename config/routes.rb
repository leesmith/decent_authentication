DecentAuthentication::Application.routes.draw do

  # Root route
  root to: 'home#index'

  # Named routes
  get 'sign_in' => 'sessions#new', as: 'sign_in'
  get 'sign_out' => 'sessions#destroy', as: 'sign_out'
  get 'register' => 'users#new', as: 'register'

  # Resource routes
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, except: [:index, :show, :destroy]

end
