class WarehouseProductsController < ApplicationController
  def index
    @warehouse_products = WarehouseProduct.order('created_at').page(params[:page]).per(10)
  end
end