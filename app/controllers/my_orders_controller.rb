class MyOrdersController < ApplicationController
  before_action :get_product
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /my_products/1/my_orders
  def index
    @my_orders = @my_product.my_orders
  end

  # GET /my_products/1/my_orders/1
  def show
    @my_order = MyOrder.find(params[:id])
  end

  # GET /my_products/1/my_orders/new
  def new
    @my_order = @my_product.my_orders.build
  end

  # POST /my_products/1/my_orders
  def create
    @my_order = @my_product.my_orders.create(my_order_params)
    if @my_order.valid?
      redirect_to my_product_my_orders_path(@my_product)
    else 
      flash[:errors] = @my_order.errors.full_messages
      redirect_to new_my_product_my_order_path
    end
  end

  # GET /my_products/1/my_orders/:id/edit
  def edit
    @my_order = MyOrder.find(params[:id])
  end

  # PATCH /my_products/1/my_orders/1
  def update 
    @my_order = MyOrder.find(params[:id])
    @my_order.update(my_order_params)
    if @my_order.valid?
      redirect_to my_product_my_orders_path(@my_product)
    else 
      flash[:errors] = @my_order.errors.full_messages
      redirect_to edit_my_product_my_order_path(@my_order)
    end
  end

  # DESTROY /my_products/1/my_orders/1
  def destroy 
    @my_order = MyOrder.find(params[:id])
    @my_order.destroy 
    redirect_to my_product_my_orders_path
  end

  private 
  def get_product
    @my_product = MyProduct.find(params[:my_product_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @my_order = @my_product.my_orders.find(params[:id])
  end

  def my_order_params
    params.require(:my_order).permit(:quantity, :total_price, :my_product_id)
  end
end
