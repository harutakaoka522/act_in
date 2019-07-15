Rails.application.routes.draw do
  root 'home#top'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :labels
  resources :favorites, only: [:create, :destroy]
  resources :pictures do
    resources :comments
  end
end
