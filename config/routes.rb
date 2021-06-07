Rails.application.routes.draw do
  resources :genres
  resources :screen_shows, :path => 'movies'
  resources :characters, only: [:index, :show, :create, :update, :destroy]
  resources :photos
  post 'sign-up', to: 'users#create'
  post 'login', to: 'authentication#authenticate'
  get('status' => 'status#index')
end