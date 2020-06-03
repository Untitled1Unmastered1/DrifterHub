class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :validate, :email_striper, :current_journey


    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    
    def logged_in?
        if !current_user
            flash[:error] = "To access this page you must first login."
            redirect_to root_path
        end
    end

    def validate
        if !logged_in?
            flash[:error] = " You are not logged in."
            redirect_to login_path 
        end
    end


    def email_striper(email)
        username = email.split(/@gmail.com/)
        username[0]
    end

    def current_journey
        @journey = Journey.find_by_id(params[:id])
    end

   
end


 
