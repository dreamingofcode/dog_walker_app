class AppointmentsController < ApplicationController
    def index
        @appointments = Appointment.all.select {|x| x.user_id == session[:id]}
    end

    def show
        @appointment = Appointment.find(params['id'])
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
        # byebug
      @appointment = Appointment.find(params['id'])
     
    end

    def update
        @appointment = Appointment.find_by(id: params['id'])
        @appointment.date = params['appointment']['date']
        @appointment.walker_id = params['appointment']['walker_id']
        @appointment.save
        redirect_to appointments_path
    end


    @article = Article.find(params[:id])
    @article.update(title: params[:article][:title], description: params[:article][:description])
    redirect_to article_path(@article)





    def destroy 
    end

    # private 
    # def appointment_params 
    #     params.require(:appointment).permit(:date, :walker)
    # end
end
