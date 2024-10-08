Rails.application.routes.draw do
  resources :pictures
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

  get '/icon_of_pictures/:id', to: 'pictures#send_icon',as: 'icon_of_pictures'
  
end
