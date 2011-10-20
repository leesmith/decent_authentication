DecentAuthentication::Application.routes.draw do
  root to: 'home#index'

  get 'register' => 'users#new', as: 'register'
  get 'sign-in' => 'sessions#new', as: 'sign_in'

  resources :users
  resources :sessions, only: [:new, :create]
end
