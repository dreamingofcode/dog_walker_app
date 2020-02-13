module SessionsHelper

    def logged_in?
      !!current_user
    end
  
    def current_user
      if session[:id]
        @current_user ||= User.find_by(id: session[:id])
      end
    end
  
    def authorize!
      redirect_to login_path unless logged_in?
    end
  
  end