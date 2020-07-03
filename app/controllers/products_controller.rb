class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update]

  def index
    @products = Product.order('created_at').page(params[:page]).per(10)
    @warehouse_products = WarehouseProduct.order('created_at').page(params[:page]).per(10)
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      warehouses = params[:product]['warehouse_products_attributes']
      if warehouses.present?
        warehouses.each do |key, value|
          warehouse = Warehouse.where(id: value['warehouse_id'].to_i).first_or_initialize
          warehouse.threshold = value['threshold']
          warehouse.count = value['item_count']
          warehouse.save
        end
      end
      redirect_to products_path
    else
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_path }
        format.json { render :index, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def product_params
    params.require(:product).permit(
        :sku_code,
        :name,
        :price,
        warehouse_products_attributes: [:id, :product_id, :warehouse_id, :threshold, :item_count, :low_item_threshold, :_destroy]
    )
  end

  def set_product
    @product = Product.find(params[:id])
  end
end