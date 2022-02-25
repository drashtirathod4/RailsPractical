class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create 
    customer = Customer.create(customer_params)
    if customer.valid?
      redirect_to customers_path
    else 
      flash[:errors] = customer.errors.full_messages
      redirect_to new_customer_path
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update 
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    if @customer.valid?
      redirect_to customer_path
    else 
      flash[:errors] = @customer.errors.full_messages
      redirect_to edit_customer_path(@customer)
    end
  end

  def destroy 
    @customer = Customer.find(params[:id])
    @customer.destroy 
    redirect_to customers_path
  end

  private 
  def customer_params
    params.require(:customer).permit(:fname, :lname, :email, :phone)
  end
end
