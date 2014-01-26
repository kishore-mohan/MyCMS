MyOwnCms::Application.routes.draw do
  resources :customer_types

  resources :customers

  root 'customers#index'

end
