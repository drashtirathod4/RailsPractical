Rails.application.routes.draw do
  # route for search by no of order page
  get 'employees/search_by_order'
  # route for query list page in employees
  get 'employees/list'
  resources :employees
  resources :faculties
  resources :students
  resources :images
  resources :authors_books
  resources :books
  resources :authors
  resources :products
  # root "articles#index"
  
  get "/articles", to: "articles#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
