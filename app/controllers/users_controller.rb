class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.valid?
      flash[:notice] = "User Signup Successfully!"
      redirect_to login_path
    else 
      flash[:errors] = user.errors.full_messages
      redirect_to signup_path
    end 
  end

  # user's profile page
  def profile
    @user = current_user
    @registered_events = @user.registers.all
  end

  # /welcome : welcome page of user
  def welcome
    @current_user = current_user
    # for list of all the user's events
    @events = @current_user.events
    # list of all the event by other users and your events too
    @allevents = Event.all
  end

  def new_event
    @user = User.find_by(id: session[:user_id])
    @event = @user.events.create()
  end

  # To enroll/register in any event
  def register_event
    @user = User.find_by(id: session[:user_id])
    @register = @user.registers.create()
  end

  # To see all the users registered in your event
  def people_registered
    @user = User.find_by(id: session[:user_id])
    events = @user.events
    events.each do |event|
      @registers = event.registers
    end
  end

  private
  def user_params
    params.require(:user).permit(:fname, :lname, :email, :phone, :password, :password_confirmation)
  end
end
