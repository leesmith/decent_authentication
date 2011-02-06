DecentAuthentication::Application.routes.draw do

  root :to => 'users#new'

  get 'sign_in' => 'sessions#new', :as => 'sign_in'
  get 'sign_out' => 'sessions#destroy', :as => 'sign_out'
  get 'register' => 'users#new', :as => 'register'

  resources :users
  resources :sessions, :except => [:show, :edit, :update]

end
