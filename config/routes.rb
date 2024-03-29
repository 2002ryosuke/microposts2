Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'users/logout', to: 'sessions#destroy'

  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create] do
    member do
      get :followings
      get :followers
    end
  end
  
  resources :microposts, only: [:create, :destroy]
  get 'microposts_disapper', to: 'microposts#destroy'
  
  resources :relationships, only: [:create, :destroy]
end
