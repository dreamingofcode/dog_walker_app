class UsersController < ApplicationController
    include SessionsHelper
   # before_action :authorize_user, only: :show

    def new
        @user = User.new
       
    end

    def create
   
        user = User.create(user_params)
        if user.valid?
            session[:id] = user.id 
            redirect_to user_path(user) 
        else
            flash[:message] = "ERROR: Unacceptable Credentials, Try Again"
            redirect_to new_user_path
        end
    end

    def show
        if session[:id]
            @current_user = User.find(session[:id])
        end
    end
    
    private

    def authorize_user
        if current_user
            redirect_to current_user if params[:id] != current_user.id
        else 
            redirect_to login_path
        end
    end

    def user_params
        params.require(:user).permit(:name,:username,:password)
    end
end
