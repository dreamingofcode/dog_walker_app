class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.user_id
        redirect_to user_path(user)
    end

    def show
        if session[:user_id]
            @current_user = User.find(session[:user_id])
        end
        @user = User.find(params[:id])
    end
    
    private

    def user_params
        params.require(:user).permit(:name,:phone_number,:username,:password)
    end
end
