Rails.application.routes.draw do
  resources :registers
  resources :categories
  
  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete 'logout', to: 'sessions#destroy'
  get 'authorized', to: 'sessions#page_requires_login'
  
  get '/signup'  => 'users#new'
  get '/welcome', to: 'users#welcome'
  get '/new_event', to:  'users#new_event'
  get '/profile', to:  'users#profile'
  get '/register_event', to:  'users#register_event'
  get '/people_registered', to:  'users#people_registered'
  resources :users

  root "events#index"
  resources :events do 
    resources :comments, module: :events
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
