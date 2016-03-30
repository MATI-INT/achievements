Rails.application.routes.draw do
  devise_for :users
  # pages - controller
  # index - action (method)
  root to: 'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
