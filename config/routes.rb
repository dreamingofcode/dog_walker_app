Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :appointments 
  resources :walkers, only: [:show]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :reviews, only: [:create, :new, :show]

  root 'application#hello'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

end
