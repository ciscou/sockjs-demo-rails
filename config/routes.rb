Rails.application.routes.draw do
  resources :messages, only: :create

  root to: 'messages#index'
end
