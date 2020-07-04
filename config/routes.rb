Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "products#index"

  resources :warehouse_products
  resources :products
  resources :warehouses, only: [:new, :create, :edit, :update, :show, :index]
end
