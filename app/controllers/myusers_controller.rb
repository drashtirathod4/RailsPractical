class MyusersController < ApplicationController
  def index
    @users = Myuser.all
  end

  def show
    @user = Myuser.find(params[:id])
  end

  def new
    @user = Myuser.new
  end

  def create 
    @user = Myuser.create(myuser_params)
    if @user.valid?
      redirect_to myusers_path
    else 
      flash[:errors] = @user.errors.full_messages
      redirect_to new_myuser_path
    end
  end

  def edit
    @user = Myuser.find(params[:id])
  end

  def update 
    @user = Myuser.find(params[:id])
    @user.update(myuser_params)
    if @user.valid?
      redirect_to myuser_path
    else 
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_myuser_path(@user)
    end
  end

  def destroy 
    @user = Myuser.find(params[:id])
    @user.destroy 
    redirect_to myusers_path
  end

  def profile 
    @user = Myuser.find(params[:id])
  end

  private
  def myuser_params
    params.require(:myuser).permit(:first_name, :last_name, :email, :password, :password_confirmation, :subscription, :subscription_email)
  end
end
