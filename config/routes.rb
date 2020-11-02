Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :rooms do
    resources :reviews, only: [:index, :new, :create]
    collection do
      get 'search'
    end
  end
end
