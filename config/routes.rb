Rails.application.routes.draw do

  get 'link/create'

  root to: 'links#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]
  resources :links, only: [:create]
end
