Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login', to: 'sessions#new' #upon receiving get login request, fire off controller 
  post 'login', to: 'sessions#create' #send to sessions controller, create action
  delete 'logout', to: 'sessions#destroy' #send to sessions controller, destroy action 
  root 'chatroom#index'
  post 'message', to: 'messages#create'

end
