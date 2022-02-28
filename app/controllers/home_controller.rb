class HomeController < ApplicationController
  def index
    if current_my_user and current_my_user.role == 'Admin'
      render :layout => 'admin'
    elsif current_my_user and current_my_user.role == 'Merchant'
      render :layout => 'merchant'
    else
    end
  end
end
