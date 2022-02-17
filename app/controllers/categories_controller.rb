class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create 
    category = Category.create(category_params)
    if category.valid?
      redirect_to categories_path
    else 
      flash[:errors] = category.errors.full_messages
      redirect_to new_category_path
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update 
    @category = Category.find(params[:id])
    @category.update(category_params)
    if @category.valid?
      redirect_to category_path
    else 
      flash[:errors] = @category.errors.full_messages
      redirect_to edit_category_path(@category)
    end
  end

  def destroy 
    @category = Category.find(params[:id])
    @category.destroy 
    redirect_to categories_path
  end

  private 
  def category_params
    params.require(:category).permit(:name)
  end
end
