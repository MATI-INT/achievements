Rails.application.routes.draw do
  devise_for :users

  resources :achievements, only: [:new, :create, :index]
  resources :posts, only: [:new, :create, :index, :show]
  resources :post_achievements, only: [:create]

  root to: 'pages#index'
end
