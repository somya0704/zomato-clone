Rails.application.routes.draw do
  get 'owner_dashboard/index'
  get 'home/index'
  root 'home#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/confirm_email' => 'users#confirm_email'
  
  resources :sessions, only: [ :create, :destory]
  resources :restaurants

end
