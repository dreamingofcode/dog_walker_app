class AppointmentsController < ApplicationController
    def index
        @appointments = Appointment.all
    end

    def show
        @appointment = Appointment.find(params['id'])
        @user = Appointment.find_by(walker_id: params[:id]).user
        @dog = Dog.find_by(user_id: @user).name
        @walker = Appointment.find(params['id']).walker
    end

    def new 
        @appointment = Appointment.new
    end

    def create 
        
        @appointment = Appointment.new(appointment_params)
        @appointment.user = 
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

    private 
    def appointment_params 
        params.require(:appointment).permit(:date, :walker)
    end
end
