Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

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
