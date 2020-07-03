class WarehousesController < ApplicationController
  before_action :set_warehouse, only: [:edit, :update, :show]

  def new
    @warehouse = Warehouse.new()
  end

  def show

  end

  def create
    @warehouse= Warehouse.new(warehouse_params)
    respond_to do |format|
      if @warehouse.save
        @warehouse_product = WarehousProductCreation.new(@warehouse).call
        format.html { redirect_to @warehouse, notice: 'Warehouse was successfully created.' }
        format.json { render :show, status: :created, location: @warehouse }
      else
        format.html { render :new }
        format.json { render json: @warehouse.errors, status: :unprocessable_entity }
      end
    end

  end


  private

  def warehouse_params
    params.require(:warehouse).permit(
        :wh_code,
        :name,
        :pincode,
        :max_capacity,
        # warehouse_products_attributes: [:id, :product_id, :warehouse_id, :item_count, :low_item_threshold, :threshold, :_destroy]
    )
  end

  def set_warehouse
    @warehouse = Warehouse.find(params[:id])
  end
end