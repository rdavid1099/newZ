Rails.application.routes.draw do
  root 'welcome#index'

  namespace :producer do
    get 'users/dashboard', to: 'users#show'
  end

  namespace :admin do
    get 'users/dashboard', to: 'users#show'
  end

  resources :stories, only: [:index] do
    resources :pitches, only: [:new, :create, :show]
  end

  resources :pitches, only: [:index]
  resources :likes_dislikes, only: [:create]
  resources :stations, only: [:show]
  resources :community, only: [:index]
  resources :comments, only: [:create]

  get 'users/edit', to: 'users#edit'
  put 'user', to: 'users#update'
  patch 'user', to: 'users#update'
  get 'users/dashboard', to: 'users#show'

  namespace :users  do
    get '/stations/subscriptions/new', to: 'stations#new', as: 'new_station'
    post '/stations/subscriptions', to: 'stations#create'
    delete '/stations/subscriptions', to: 'stations#destroy'
  end

  get '/auth/twitter', as: :twitter_login
  get '/auth/twitter/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
