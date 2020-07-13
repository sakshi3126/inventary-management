Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "products#index"

  resources :warehouse_products
  resources :products
  resources :warehouses do
    get 'add_item_count'
  end
end
