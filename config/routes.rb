Rails.application.routes.draw do
  
  get 'staff_dashobard/index'
  get 'staffs/create'
  
  get 'owner_dashboard/index'
  get 'owner_dashboard/remove_staff'

  get 'owner/signup' => 'owners#new'

  get 'home/index'
  root 'sessions#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/confirm_email' => 'users#confirm_email'
  
  resources :sessions, only: [ :create, :destory]
  resources :restaurants
  resources :staffs

end
