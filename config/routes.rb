Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index]
  resources :personal_messages, only: [:new, :create]
  resources :conversations, only: [:index, :show]

  root 'conversations#index'
  get '/search_users', to: 'users#search'
end
