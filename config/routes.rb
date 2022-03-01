Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :my_users
  resources :my_users
  
  namespace :business do
    resources :my_customers, only: [:create, :edit, :index] do
      member do
        get 'preview', to: 'my_customers#show'
        delete 'delete_customer', to: 'my_customers#destroy'
        patch 'update', to: 'my_customers#update'
      end
      get 'search', on: :collection
      get 'new', on: :collection, as: :new
    end
  end

  resources :my_products do
    resources :my_orders
  end
  
  # root "my_products#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
