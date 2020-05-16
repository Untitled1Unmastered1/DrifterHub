Rails.application.routes.draw do

  get '/signup', to: 'users#new'
  get '/', to: 'application#welcome' 
  get '/login', to: 'sessions#login'
  

  resources :users 
  resources :journeys do 
    resources :comments, only: [:new, :create]
  end


  delete '/logout', to: 'sessions#destroy'
end

#if you want to add any custom routes, add them at the top 
