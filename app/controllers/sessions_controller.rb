class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "User Login Successfully!"
      redirect_to welcome_path
    elsif @user || @user.authenticate(params[:password])
      flash[:notice] = "Invalid email or password"
      redirect_to login_path
    else
      redirect_to 'login'
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Logged out successfully!"
    redirect_to '/'
  end

  def page_requires_login
  end
end
