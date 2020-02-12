class UsersController < ApplicationController
    def new
        @user = User.new
       
    end

    def create
   
        user = User.create(user_params)

        session[:id] = user.id 
        redirect_to user_path(user) #if @user.valid?
       
            # flash[:message] =
            # redirect_to new_user_path
        
    end

    def show
        if session[:id]
            @current_user = User.find(session[:id])
        end
        @user = User.find(params[:id])

        @dogs = Dog.where(user_id: session[:id])
        
    end
    
    private

    def user_params
        params.require(:user).permit(:name,:username,:password)
    end
end
