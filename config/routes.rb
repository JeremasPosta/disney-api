Rails.application.routes.draw do
  resources :genres, only: [:index, :show, :create, :update, :destroy]
  resources :movies, only: [:index, :show, :create, :update, :destroy]
  resources :characters, only: [:index, :show, :create, :update, :destroy]
  resources :photos, only: [:index, :show, :create, :update, :destroy]
  resources :cast_in_movies, only: [:index, :show, :create, :update, :destroy]

  post 'sign-up', to: 'users#create'
  post 'login', to: 'authentication#authenticate'
end