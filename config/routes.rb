Rails.application.routes.draw do
  root 'welcome#index'

  namespace :producer do
    get 'users/dashboard', to: 'users#show'
  end

  namespace :admin do
    get 'users/dashboard', to: 'users#show'
  end

  resources :stations, only: [:show]
  resources :community, only: [:index]

  get 'users/dashboard', to: 'users#show'
  get 'users/location/edit', to: 'users#edit'
  put 'users/location', to: 'users#update'

  namespace :users  do
    resources :pitches, only: [:new, :create, :show]
    get '/stations/subscriptions/new', to: 'stations#new', as: 'new_station'
    post '/stations/subscriptions', to: 'stations#create'
    delete '/stations/subscriptions', to: 'stations#destroy'
  end

  get '/auth/twitter', as: :twitter_login
  get '/auth/twitter/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
