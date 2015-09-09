Rails.application.routes.draw do

  get 'sessions/new'

  root to: 'static_pages#home'
  get 'signup',  to: 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  resources :users do
    member do
      get :followings
      get :followers
    end
  end
  resources :microposts
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy , :show]
end
