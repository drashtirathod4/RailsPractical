class MyProductsController < ApplicationController
  before_action :auth_admin, except: [:show]
  before_action :authenticate_my_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET	/my_products
  def index
    @my_products = MyProduct.all
  end

  # GET	/my_products/1
  def show
    @my_product = MyProduct.find(params[:id])
  end

  # GET	/my_products/new
  def new
    @my_product = MyProduct.new
  end

  # POST /my_products
  def create
    my_product = MyProduct.create(my_product_params)
    if my_product.valid?
      redirect_to my_products_path
    else 
      flash[:errors] = my_product.errors.full_messages
      redirect_to new_my_product_path
    end
  end

  # GET	/my_products/1/edit
  def edit
    @my_product = MyProduct.find(params[:id])
  end

  # PATCH/PUT	/my_products/1
  def update 
    @my_product = MyProduct.find(params[:id])
    @my_product.update(my_product_params)
    if @my_product.valid?
      redirect_to my_product_path
    else 
      flash[:errors] = @my_product.errors.full_messages
      redirect_to edit_my_product_path(@my_product)
    end
  end

  # DELETE	/my_products/1
  def destroy 
    @my_product = MyProduct.find(params[:id])
    @my_product.destroy 
    redirect_to my_products_path
  end

  private 
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @my_product = MyProduct.find(params[:id])
  end

  def my_product_params
    params.require(:my_product).permit(:title, :description, :price)
  end
end
