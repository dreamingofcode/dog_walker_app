class ApplicationController < ActionController::Base
    
    def current_user
        session[:name] ||=nil
    end

    def hello 
        redirect_to controller:'sessions', action: 'new' unless session[:name] #match with user params
    end

    def authenticate
    end

    def require_logged_in
        redirect_to controller: 'sessions', action: 'new' unless session[:name]
    end
end
