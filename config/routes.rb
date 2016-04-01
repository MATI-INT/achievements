Rails.application.routes.draw do
  devise_for :users

  resources :achievements, only: [:new, :create, :index]

  root to: 'pages#index'
end
