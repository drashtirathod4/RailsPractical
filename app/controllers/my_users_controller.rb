class MyUsersController < ApplicationController
  def index
  end

  def new
    @user = MyUser.new
  end

  def create
    user = MyUser.create(my_user_params)
    if user.valid?
      redirect_to my_users_path
    else 
      flash[:errors] = my_user.errors.full_messages
      redirect_to new_my_user_path
    end
  end
end
