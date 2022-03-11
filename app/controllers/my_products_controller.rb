class MyProductsController < ApplicationController
  before_action :auth_admin, except: [:show]
  before_action :authenticate_my_user!
  before_action :get_user
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET	/my_products
  def index
    @my_products = @my_user.my_products
  end

  # GET	/my_products/1
  def show
    @my_product = MyProduct.find(params[:id])
  end

  # GET	/my_products/new
  def new
    @my_product = @my_user.my_products.build
  end

  # POST /my_products
  def create
    my_product = @my_user.my_products.create(my_product_params)
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
  def get_user
    @my_user = current_my_user
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    if @my_user.role == "Admin"
      @my_product = @my_user.my_products.find(params[:id])
    else
      @my_product = MyProduct.find(params[:id])
    end
  end

  def my_product_params
    params.require(:my_product).permit(:title, :description, :price, :my_user_id)
  end
end
