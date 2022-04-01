class HomeController < ApplicationController
    # before_action :authenticate_api_user!
    def index
        render json: current_api_user
        # if api_user_signed_in?
        #     render json: current_api_user.id
        # else
        #     puts "Not signed in!"
        #     render json: ApiUser.all
        # end
    end
end
