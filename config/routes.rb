Rails.application.routes.draw do
  resources :characters
  resources :characters, only: [:index, :show, :create, :update, :destroy]
  resources :photos
  get('status' => 'status#index')
end