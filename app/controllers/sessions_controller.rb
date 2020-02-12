class SessionsController < ApplicationController

    def login
    end

    def new
    end

    def create #find user, authenticate via the password, set session id to user id, redirect to show page, else redirect to log in
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            #return redirect_to(controller: 'sessions', action: 'new') if !params[:name] || params[:name].empty?
            session[:user_id] = user.id
            redirect_to controller: 'application', action: 'hello'
        else
            flash[:message]= "ERROR: Invalid Credentials, Try Again!"
            redirect_to login_path
        end

    end

    def destroy 
        session.delete(:name) if session[:name]
        redirect_to controller: 'application', action: 'hello'
    end
end