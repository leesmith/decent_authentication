Rails.application.routes.draw do
  root to: 'home#index'

  get 'register' => 'users#new', as: 'register'
  get 'sign-in' => 'sessions#new', as: 'sign_in'
  delete 'sign-out' => 'sessions#destroy', as: 'sign_out'

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
