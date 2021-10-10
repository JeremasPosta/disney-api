Rails.application.routes.draw do
  resources :genres
  resources :movies
  resources :characters, only: [:index, :show, :create, :update, :destroy]
  resources :photos
  root to: 'resumes#index'
  post 'sign-up', to: 'users#create'
  post 'login', to: 'authentication#authenticate'
  get('status' => 'status#index')
end