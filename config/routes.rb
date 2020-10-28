Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :tweets, only: [:index, :new, :create] do
    collection do
      get 'search'
    end
  end
end
