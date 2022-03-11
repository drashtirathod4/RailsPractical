class ApplicationController < ActionController::Base
    # before_action :authenticate_my_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :role])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :role])
    end

    private
    # to authenticat admin 
    def auth_admin
        if my_user_signed_in? && current_my_user.role == "Merchant"
            flash[:notice] = "Only Admin can edit or add Products"
            redirect_to root_path # halts request cycle
        end
    end 
end
