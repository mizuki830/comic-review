Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :room, only: [:index, :new, :create]
end
