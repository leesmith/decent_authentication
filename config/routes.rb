Rails.application.routes.draw do
  root to: 'home#index'

  get 'register' => 'users#new', as: 'register'
  get 'sign-in' => 'sessions#new', as: 'signin'
  delete 'sign-out' => 'sessions#destroy', as: 'signout'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]

  get 'profile' => 'profile#edit', as: 'profile'
  patch 'profile' => 'profile#update', as: 'update_profile'
end
