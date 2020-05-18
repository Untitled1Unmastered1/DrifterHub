Rails.application.routes.draw do

  get '/signup', to: 'users#new'
  get '/', to: 'application#welcome' 
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  

  resources :users 
  resources :journeys do 
    resources :comments, only: [:new, :create, :show]
  end


  delete '/logout', to: 'sessions#destroy'
  root 'application#welcome'
end

#if you want to add any custom routes, add them at the top 
