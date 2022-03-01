class Business::MyCustomersController < ApplicationController
  before_action :find_customer, only: [:show, :edit, :update, :destroy]

  # GET /business/my_customers
  def index
    @my_customers = MyCustomer.all
  end

  # GET /business/my_customers/1/preview
  def show
    @my_customer = MyCustomer.find(params[:id])
  end

  # GET /business/my_customers/new
  def new
    @my_customer = MyCustomer.new
  end

  # POST /business/my_customers
  def create
    my_customer = MyCustomer.create(my_customer_params)
    if my_customer.valid?
      redirect_to business_my_customers_path
    else 
      flash[:errors] = my_customer.errors.full_messages
      redirect_to new_business_my_customers_path(my_customer)
    end
  end

  # GET /business/my_customers/1/edit
  def edit
    @my_customer = MyCustomer.find(params[:id])
  end

  # PATCH /business/my_customers/1/update
  def update 
    @my_customer = MyCustomer.find(params[:id])
    @my_customer.update(my_customer_params)
    if @my_customer.valid?
      redirect_to business_my_customers_path
    else 
      flash[:errors] = @my_customer.errors.full_messages
      redirect_to edit_business_my_customer_path(@my_customer)
    end
  end

  # DELETE /business/my_customers/1/delete_customer
  def destroy 
    @my_customer = MyCustomer.find(params[:id])
    @my_customer.destroy 
    redirect_to business_my_customers_path
  end

  # To search customers by name
  # GET /business/my_customers/search
  def search
    @my_customers = MyCustomer.search(params[:search])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def find_customer
    @my_customer = MyCustomer.find(params[:id])
  end

  def my_customer_params
    params.require(:my_customer).permit(:name, :email, :phone)
  end
end
