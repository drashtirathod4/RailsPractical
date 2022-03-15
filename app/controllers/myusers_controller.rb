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
      redirect_to profile_path(@user)
    end
  end

  def destroy 
    @user = Myuser.find(params[:id])
    @user.destroy 
    redirect_to myusers_path
  end

  def change_password 
    @user = Myuser.find(params[:id])
  end

  def password_update
    @user = Myuser.find(params[:id])
    if @user.update(:password => params[:myuser][:password], :password_confirmation => params[:myuser][:password_confirmation])
      flash[:notice] = 'Password was changed successfully.'
    else
      flash[:error]=[]
      @user.errors.full_messages.each do |error|
        flash[:error] << error
      end
    end
  end

  private
  def myuser_params
    params.require(:myuser).permit(:first_name, :last_name, :email, :password, :password_confirmation, :subscription, :subscription_email)
  end
end
