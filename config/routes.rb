Rails.application.routes.draw do
  #get 'home/top'
  root to: 'home#top'
  resources :pictures
  resources :blocks
  resources :follows
  # resource :user
  get 'user/:id/edit', to: 'user#edit', as: 'edit_user'
  patch 'user/:id', to: 'user#update'
  put 'user/:id', to: 'user#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/user_edit/:id', to: 'user#edit'
  # post '/user_update/:id', to: 'user#update'
  get '/signup', to: 'user#new'
  post '/signup', to: 'user#create'
  get '/user/:id', to: 'user#show', as: 'profile'
  delete '/user/:id', to: 'user#destroy', as: 'unsubscribe'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/icon_of_pictures/:id', to: 'pictures#send_icon',as: 'icon_of_pictures'
  get '/icon_of_users/:id', to: 'user#send_icon',as: 'icon_of_users'
end
