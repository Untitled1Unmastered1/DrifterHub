Rails.application.routes.draw do

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/', to: 'application#welcome' 
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/users/:id/commented_journeys', to: 'commented_journeys#index', as: :commented_journeys
  

  resources :users, only: [:new, :show, :create, :edit, :update, :destroy]
  resources :journeys do 
    resources :comments, only: [:new, :create, :index]
  end

  delete '/logout', to: 'sessions#destroy'
  root 'application#welcome' 
end

#if you want to add any custom routes, add them at the top 
