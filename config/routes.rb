Rails.application.routes.draw do
  root 'home#top'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :labels
  resources :pictures do
    resources :comments
  end
end
