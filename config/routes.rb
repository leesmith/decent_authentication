DecentAuthentication::Application.routes.draw do
  root to: 'home#index'

  get 'register' => 'users#new', as: 'register'
  get 'sign-in' => 'sessions#new', as: 'sign_in'
  get 'sign-out' => 'sessions#destroy', as: 'sign_out'

  resources :users
  resources :sessions, only: [:new, :create]
end
