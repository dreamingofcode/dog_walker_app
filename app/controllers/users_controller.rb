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
        @appointments = Appointment.all.select {|x| x.user_id == session[:id]}
        @appointment = Appointment.find(params['id'])
        @user = Appointment.find_by(walker_id: params[:id]).user
        @dog = Dog.find_by(user_id: @user).name
        @walker = @appointment.walker
    end
    
    private

    def user_params
        params.require(:user).permit(:name,:username,:password)
    end
end
