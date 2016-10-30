Rails.application.routes.draw do
  root 'welcome#index'

  namespace :producer do
    get 'users/dashboard', to: 'users#show'
  end

  namespace :admin do
    get 'users/dashboard', to: 'users#show'
  end

  resources :community, only: [:index]

  get 'users/dashboard', to: 'users#show'
  get 'users/location/edit', to: 'users#edit'
  put 'users/location', to: 'users#update'

  namespace :users  do
    get '/stations/subscriptions/new', to: 'stations#new', as: 'new_station'
    post '/stations/subscriptions', to: 'stations#create'
  end

  get '/auth/twitter', as: :twitter_login
  get '/auth/twitter/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
