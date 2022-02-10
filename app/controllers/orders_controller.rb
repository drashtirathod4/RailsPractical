class OrdersController < ApplicationController
  def index
    @orders = Order.search(params[:search])
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    order = Order.create(order_params)
    if order.valid?
      redirect_to orders_path
    else
      flash[:errors] = order.errors.full_messages
      redirect_to new_order_path
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update 
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.valid?
      redirect_to order_path 
    else 
      flash[:errors] = @order.errors.full_messages
      redirect_to edit_order_path(@order)
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end

  def most_sales_product_by_quantity
    @orders = Order.group(:customer_id).limit(3)
  end

  def most_sales_product_by_price
    @orders = Order.group(:customer_id).order("total_price desc").limit(3)
  end

  def most_booked_order_of_product
    @orders = Order.group(:customer_id).where(status: "booked").limit(5)
  end

  def most_cancelled_order_of_product
    @orders = Order.group(:customer_id).where(status: "cancelled").limit(5)
  end

  def filtered_data
    @orders = Order.status_search(params[:status_search])
  end

  private
  def order_params
    params.require(:order).permit(:quantity, :total_price, :product_id, :status, :customer_id)
  end
end
