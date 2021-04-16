Rails.application.routes.draw do
    
  
    root to: 'tasks#index'
    get 'signup', to: 'users#new'
  post 'users' ,to: 'users#create'
    
  resources :tasks
end
