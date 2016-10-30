Rails.application.routes.draw do
  root 'welcome#index'

  namespace :producer do
    get 'users/dashboard', to: 'users#show'
  end

  namespace :admin do
    get 'users/dashboard', to: 'users#show'
  end

  get 'users/dashboard', to: 'users#show'
  namespace :users  do
    get '/stations/subscriptions/new', to: 'stations#new', as: 'new_station'
  end

  get '/auth/twitter', as: :twitter_login
  get '/auth/twitter/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
