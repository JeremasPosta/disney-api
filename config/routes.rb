Rails.application.routes.draw do
  resources :genres, only: [:index, :show, :create, :update, :destroy]
  resources :movies, only: [:index, :show, :create, :update, :destroy]
  resources :characters, only: [:index, :show, :create, :update, :destroy]
  resources :photos, only: [:index, :show, :create, :update, :destroy]
  root to: 'resumes#index'
  post 'sign-up', to: 'users#create'
  post 'login', to: 'authentication#authenticate'
  get('status' => 'status#index')
end