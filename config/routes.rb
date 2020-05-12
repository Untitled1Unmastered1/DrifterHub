Rails.application.routes.draw do

  get '/signup' => 'users#new'

  
  resources :comments
  resources :users
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

#if you want to add any custom routes, add them at the top 
