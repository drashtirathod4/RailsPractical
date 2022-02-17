class RegistersController < ApplicationController
  def new
    @register = Register.new
  end

  def create 
    register = Register.create(register_params)
    if register.valid?
      redirect_to welcome_path
    else 
      flash[:errors] = register.errors.full_messages
      redirect_to register_event_path
    end
  end

  def show
    @register = Register.find(params[:id])
  end

  private 
  def register_params
    params.require(:register).permit(:user_id, :event_id)
  end
end
