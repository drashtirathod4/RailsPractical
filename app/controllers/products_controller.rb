class ProductsController < ApplicationController
  def index
    @products = Product.unscoped.all
  end

  def show
    @product = Product.unscoped.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create 
    product = Product.create(product_params)
    if product.valid?
      redirect_to products_path
    else 
      flash[:errors] = product.errors.full_messages
      redirect_to new_product_path
    end
  end

  def edit
    @product = Product.unscoped.find(params[:id])
  end

  def update 
    @product = Product.unscoped.find(params[:id])
    @product.update(product_params)
    if @product.valid?
      redirect_to product_path
    else 
      flash[:errors] = @product.errors.full_messages
      redirect_to edit_product_path(@product)
    end
  end

  def destroy 
    @product = Product.unscoped.find(params[:id])
    @product.destroy 
    redirect_to products_path
  end

  def product_list
    @products = Product.all
  end

  private 
  def product_params
    params.require(:product).permit(:title, :description, :price, :capacity, :is_active, :status)
  end
end
