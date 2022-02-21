Rails.application.routes.draw do
  get "/search", to: "my_employees#search"
  resources :my_employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
