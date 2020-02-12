Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :appointments 
  resources :walkers, only: [:show]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :reviews, only: [:create, :new, :show]
  resources :dogs, only: [:new,:create]

  root 'application#hello'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

end


# Prefix Verb   URI Pattern                                                                              Controller#Action
# appointments GET    /appointments(.:format)                                                                  appointments#index
#              POST   /appointments(.:format)                                                                  appointments#create
# new_appointment GET    /appointments/new(.:format)                                                              appointments#new
# edit_appointment GET    /appointments/:id/edit(.:format)                                                         appointments#edit
#  appointment GET    /appointments/:id(.:format)                                                              appointments#show
#              PATCH  /appointments/:id(.:format)                                                              appointments#update
#              PUT    /appointments/:id(.:format)                                                              appointments#update
#              DELETE /appointments/:id(.:format)                                                              appointments#destroy
#       walker GET    /walkers/:id(.:format)                                                                   walkers#show
#        users POST   /users(.:format)                                                                         users#create
#     new_user GET    /users/new(.:format)                                                                     users#new
#    edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#         user GET    /users/:id(.:format)                                                                     users#show
#              PATCH  /users/:id(.:format)                                                                     users#update
#              PUT    /users/:id(.:format)                                                                     users#update
#      reviews POST   /reviews(.:format)                                                                       reviews#create
#   new_review GET    /reviews/new(.:format)                                                                   reviews#new
#       review GET    /reviews/:id(.:format)                                                                   reviews#show
#         dogs POST   /dogs(.:format)                                                                          dogs#create
#      new_dog GET    /dogs/new(.:format)                                                                      dogs#new
#         root GET    /                                                                                        application#hello
#        login GET    /login(.:format)                                                                         sessions#new
#              POST   /login(.:format)                                                                         sessions#create
#       logout POST   /logout(.:format)                                                                        sessions#destroy
#       signup GET    /signup(.:format)                                                                        users#new
#              POST   /signup(.:format)   