Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  #root to: 'tasks#index'
   root to: 'toppages#new'
  
  get 'login', to: 'toppages#new'
  post 'login', to: 'toppages#create'
  delete 'logout', to: 'toppages#destroy'
  
  get 'signup', to: 'users#new'
  get 'usertask',to: 'toppages#index'
  
   delete 'delete', to: 'usertasks#destroy'
  

  
  resources :users, only: [:index, :show, :new, :create]

  resources :usertasks
end
