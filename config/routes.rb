Rails.application.routes.draw do
  #get 'home/top'
  root to: 'home#top'
  resources :blocks
  resources :follows
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/signup', to: 'user#new'
  post '/signup', to: 'user#create'
  get '/user/:id', to: 'user#show', as: 'profile'
  delete '/user/:id', to: 'user#destroy', as: 'unsubscribe'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
end
