Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :rooms do
    resources :reviews
    resources :tags
    collection do
      get 'search'
    end
  end
end
