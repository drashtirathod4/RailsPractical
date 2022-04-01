Rails.application.routes.draw do
  root "home#index"
  resources :api_users

  devise_for :api_users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }

  namespace :api do
    namespace :v1 do
      resources :articles
      resources :articles_comments
      get 'search' => 'articles#search'
      get 'comment_search' =>  'articles_comments#search'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
