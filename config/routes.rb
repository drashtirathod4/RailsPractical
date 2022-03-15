Rails.application.routes.draw do
  resources :myusers, except: [:edit] do
    member do
      get 'change_password'
      patch 'password_update'
    end
  end
  match 'myusers/:id/profile' => 'myusers#edit', :via => :get, :as => :profile
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
