Rails.application.routes.draw do
  resources :members
  resources :messages
  resources :rooms
  resources :groupmessages
  resources :groupmembers
  resources :groups
  get 'search/top'

  get '/user_search', to:'search#search'
  post '/user_result', to:'search#result'

  get 'chat/top'
  #get 'home/top'
  root to: 'home#top'
  resources :pictures
  resources :blocks
  resources :follows
  resources :user

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/signup', to: 'user#new'
  post '/signup', to: 'user#create'
  get '/user/:id', to: 'user#show', as: 'profile'
  delete '/user/:id', to: 'user#destroy', as: 'unsubscribe'
  delete 'followed_user/:id', to: 'follows#destroy', as: 'followunsubscribe'
  delete 'blocked_user/:id', to: 'blocks#destroy', as: 'blockunsubscribe'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/icon_of_pictures/:id', to: 'pictures#send_icon',as: 'icon_of_pictures'
  get '/icon_of_users/:id', to: 'user#send_icon',as: 'icon_of_users'
end
