class DogsController < ApplicationController

    def new
        @dog = Dog.new
    end

    def create
        @dog = Dog.new
        @dog.name = params[:dog][:name]
        @dog.breed = params[:dog][:breed]
        @dog.user_id = session[:id]
     
        @dog.save
        @user = User.find_by(id: session[:id])
        redirect_to user_path(@user)
        
    end

    def destroy
        @dog = Dog.find_by(user_id: session[:id]).destroy
        @user = User.find_by(id: session[:id])
        redirect_to user_path(@user)
    end
    # private

    # def dog_params
    #     params.require(:dog).permit(:name, :breed, :user_id)
    # end


end