class MyusersController < ApplicationController
  # GET	/myusers
  def index
    @users = Myuser.all
  end

  # GET	/myusers/1
  def show
    @user = Myuser.find(params[:id])
  end

  # GET	/myusers/new
  def new
    @user = Myuser.new
  end

  # POST	/myusers
  def create 
    @user = Myuser.create(myuser_params)
    if @user.valid?
      flash[:notice] = 'User created successfully!'
      redirect_to myusers_path
    else 
      flash[:errors] = @user.errors.full_messages
      redirect_to new_myuser_path
    end
  end

  # GET	/myusers/1/profile
  def edit
    @user = Myuser.find(params[:id])
  end

  # PATCH/PUT	/myusers/1
  def update 
    @user = Myuser.find(params[:id])
    @user_data = Myuser.find_by_id(@user)
    @user.update(myuser_params)
    if @user.valid?
      respond_to do |format|
        flash.now[:notice] = "Profile updated successfully"
        format.js 
      end
    else 
      respond_to do |format|
        flash.now[:errors] =  @user.errors.full_messages
        format.js
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE	/myusers/1
  def destroy 
    @user = Myuser.find(params[:id])
    @user.destroy 
    flash[:notice] = 'User removed successfully.'
    redirect_to myusers_path
  end

  # GET	/myusers/1/change_password
  def change_password 
    @user = Myuser.find(params[:id])
  end

  # PATCH	/myusers/1/password_update
  def password_update
    @user = Myuser.find(params[:id])
    if @user.update_attribute(:password,params[:myuser][:password])
      flash[:notice] = 'Password was changed successfully.'
      redirect_to myuser_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to password_update_myuser_path(@user)
    end
  end

  private
  def myuser_params
    params.require(:myuser).permit(:first_name, :last_name, :email, :password, :password_confirmation, :subscription, :subscription_email)
  end
end
