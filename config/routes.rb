Rails.application.routes.draw do
  devise_for :users

  resources :achievements, only: [:new, :create, :index]
  resources :posts, only: [:new, :create, :index, :show]
  resources :post_achievements, only: [:create]
  resources :categories, only: [:new, :create, :index]
  resources :votes, only: [:create]
  resources :users, only: [:show]

  root to: 'categories#index'
end
