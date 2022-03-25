Rails.application.routes.draw do
  # get 'patients/index'
  get 'home/top', to:'home#top'
  # get '/home', to:'home#top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "sessions#new"
  get 'patients/userdata', to:'patients#userdata'
  resources :patients
  resources :home, only: [ :new, :create, :show]
  get 'login', to: "sessions#new"
  post 'login',to: "sessions#create"
  delete 'logout', to: "sessions#destroy" 
  
  
  
end
