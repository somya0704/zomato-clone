Rails.application.routes.draw do
  get 'dashboard/index'
  get 'home/index'
  root 'home#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  
  resources :sessions, only: [ :create, :destory]

end
