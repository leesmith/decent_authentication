DecentAuthentication::Application.routes.draw do
  root to: 'users#new'

  get 'register' => 'users#new', as: 'register'

  resources :users
end
