class SessionsController < ApplicationController
include SessionsHelper
before_action :authorize!, except: [:new, :create]

    def login
    end

    def new
    end

    def create #find user, authenticate via the password, set session id to user id, redirect to show page, else redirect to log in
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:id] = user.id
            redirect_to user_path(user.id)
            
        else
            flash[:message]= "ERROR: Invalid Credentials, Try Again!"
            redirect_to login_path
        end
    end
    #log-out
    def destroy 
        session.delete(:id) if session[:id]
        redirect_to login_path
    end
end