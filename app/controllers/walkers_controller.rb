class WalkersController < ApplicationController
    def index 
        @walker = Walker.all 
    end     

    def show 
        @walker = Walker.find(params[:id])
        # @appointments = @walker.appointments 
        # @appointment = Appointment.find_by(walker_id: params[:id])
        # @user = Appointment.find_by(walker_id: params[:id]).user
        # @dogs = Dog.find_by(user_id: @user)  
        # @appointments = Walker.find(params[:id])
        @appointments = Appointment.select{|t| t.walker_id == @walker.id}
        @reviews = @appointments.select{|t| t.reviews }
        # @ratings = @reviews.select{ |t| t.rating }
    end
end
