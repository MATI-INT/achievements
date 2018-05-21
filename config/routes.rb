Rails.application.routes.draw do
  devise_for :users

  resources :achievements, only: [:new, :create, :index, :destroy]
  resources :posts
  resources :post_achievements, only: [:create]
  resources :categories, only: [:new, :create, :index]
  resources :votes, only: [:create]
  resources :users, only: [:show, :index, :destroy] do
    member do
      get 'toggle_rights'
    end
  end
  resources :comments, only: [:create]

  namespace :api do
    resources :visits, only: %i(create) # => [:create]
  end

  resources :statistics, only: %i(index show) do
    member do
      get 'post'
    end
  end

  resources :callouts

  root 'categories#index'
end
