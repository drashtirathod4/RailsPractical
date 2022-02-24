class MyProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  def index
    @my_products = MyProduct.all
  end

  def show
    @my_product = MyProduct.find(params[:id])
  end

  def new
    @my_product = MyProduct.new
  end

  def create
    my_product = MyProduct.create(my_product_params)
    if my_product.valid?
      redirect_to my_products_path
    else 
      flash[:errors] = my_product.errors.full_messages
      redirect_to new_my_product_path
    end
  end

  def edit
    @my_product = MyProduct.find(params[:id])
  end

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

  def destroy 
    @my_product = MyProduct.find(params[:id])
    @my_product.destroy 
    redirect_to my_products_path
  end

  private 
  def set_product
    @my_product = MyProduct.find(params[:id])
  end

  def my_product_params
    params.require(:my_product).permit(:title, :description, :price)
  end
end
