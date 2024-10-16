Rails.application.routes.draw do
  #get 'home/top'
  root to: 'home#top'
  resources :pictures
  resources :blocks
  resources :follows
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/signup', to: 'user#new'
  post '/signup', to: 'user#create'
  get '/user/:id', to: 'user#show', as: 'profile'
  delete '/user/:id', to: 'user#destroy', as: 'unsubscribe'
  delete 'followed_user_id', to: 'follows#destroy', as: 'followunsubscribe'
  delete 'blocked_user_id', to: 'blocks#destroy', as: 'blockunsubscribe'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/icon_of_pictures/:id', to: 'pictures#send_icon',as: 'icon_of_pictures'
  get '/icon_of_users/:id', to: 'user#send_icon',as: 'icon_of_users'
end
