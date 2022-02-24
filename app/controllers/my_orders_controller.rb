class MyOrdersController < ApplicationController
  before_action :get_product
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @my_orders = @my_product.my_orders
  end

  def show
    @my_order = MyOrder.find(params[:id])
  end

  def new
    @my_order = @my_product.my_orders.build
  end

  def create
    @my_order = @my_product.my_orders.build(my_order_params)
    if @my_order.valid?
      redirect_to my_product_my_orders_path(@my_product)
    else 
      flash[:errors] = @my_order.errors.full_messages
      redirect_to new_my_product_my_order_path
    end
  end

  def edit
    @my_order = MyOrder.find(params[:id])
  end

  def update 
    @my_order = MyOrder.find(params[:id])
    @my_order.update(my_order_params)
    if @my_order.valid?
      redirect_to my_product_my_orders_path(@my_order)
    else 
      flash[:errors] = @my_order.errors.full_messages
      redirect_to edit_my_product_my_order_path(@my_order)
    end
  end

  def destroy 
    @my_order = MyOrder.find(params[:id])
    @my_order.destroy 
    redirect_to my_product_my_orders_path
  end

  private 
  
  def get_product
    @my_product = MyProduct.find(params[:my_product_id])
  end

  def set_order
    @my_order = @my_product.my_orders.find(params[:id])
  end

  def my_order_params
    params.require(:my_order).permit(:quantity, :my_product_id)
  end
end
