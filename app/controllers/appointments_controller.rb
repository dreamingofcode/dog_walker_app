class AppointmentsController < ApplicationController
    def index
        @appointments = Appointment.all
    end

    def show
        @appointment = Appointment.find(params['id'])
        @user = Appointment.find_by(walker_id: params[:id]).user
        @dog = Dog.find_by(user_id: @user).name
        @walker = @appointment.walker
        
    end

    def new 
        @appointment = Appointment.new
        # @walker = Walker.find(params['appointment']['walker'])
    end

    def create 
        
        @appointment = Appointment.new
        @walker = Walker.find(params['appointment']['walker_id'])
        # @appointment.user = User.find(session[:id])
        @appointment.walker = @walker
        @appointment.date = params['appointment']['date']
        @appointment.user_id = session[:id]
        @appointment.save
        # byebug
        redirect_to appointments_path
    end

    def edit
      @appointment = Appointment.find(params[:id])

    end

    def update
        redirect_to appointment_path(@appointment)
    end

    def destroy 
    end

    # private 
    # def appointment_params 
    #     params.require(:appointment).permit(:date, :walker)
    # end
end
