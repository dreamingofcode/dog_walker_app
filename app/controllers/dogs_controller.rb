class DogsController < ApplicationController

    def new
        @dog = Dog.new
    end

    def create
        @dog = Dog.new
        @dog.name = params[:name]
        @dog.breed = params[:breed]
        @dog.user_id = session[:user_id]
        @dog.save
        @user = User.find_by(id: session[:id])
        redirect_to user_path(@user)
        
    end

    # private

    # def dog_params
    #     params.require(:dog).permit(:name, :breed, :user_id)
    # end


end