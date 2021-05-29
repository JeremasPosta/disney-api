Rails.application.routes.draw do
  resources :characters, only: [:index, :show, :create, :update, :destroy]
  resources :photos
  post 'sign-up', to: 'users#create'
  post 'login', to: 'authentication#authenticate' 
  post 'authenticate', to: 'authentication#authenticate'
  get('status' => 'status#index')
end