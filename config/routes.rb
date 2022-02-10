Rails.application.routes.draw do
  # route of filtered data of orders
  get 'orders/filtered_data'

  # route of most cancelled order of product
  get 'orders/most_cancelled_order_of_product'

  # route of most booked order of product
  get 'orders/most_booked_order_of_product'

  # route of most saled products by quantity
  get 'orders/most_sales_product_by_price'

  # route of most saled products by quantity
  get 'orders/most_sales_product_by_quantity'

  resources :orders
  resources :customers

  #route for product list with default scope
  get 'products/product_list' 

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
  root "articles#index"
end
