Rails.application.routes.draw do

  get 'link/create'

  root to: 'links#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]
  resources :links, only: [:create, :edit, :update]
  get '/links/:id', to: 'links#create'
  put '/links/:id/toggle', to: 'links#toggle_read', as: 'toggle_read'

  namespace 'api' do
    namespace 'v1' do
      resources :links, only: [:update]
    end
  end
end
