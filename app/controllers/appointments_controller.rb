class AppointmentsController < ApplicationController
    def index
        @appointments = Appointment.all
    end

    def show
        @appointment = Appointment.find(params['id'])
    end

    def new 
        @appointment = Appointment.new
    end

    def create 
        @appointment = Appointment.new
        @appointment.user = User.find_by(name: params['appointment']['user'])
        @appointment.date = params['appointment']['date']
        @appointment.walker = Walker.find(params['appointment']['walker'])
        @appointment.save
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
        params.require(:appointment).permit(:user, :walker, :date)
    end
end
