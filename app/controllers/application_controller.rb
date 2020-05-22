class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :owned_by_user?, :other_user, :not_user, :email_striper

    def welcome
        
    end


    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    

    def logged_in?
        if !current_user
            flash[:error] = "To access this page you must first login."
            redirect_to root_path
        end
    end

    def not_user?
        !!current_user 
    end

    def validate
        if !logged_in?
            flash[:error] = " You are not logged in."
            redirect_to login_path 
        end
    end

    def owned_by_user?(journeys)
        if @journey != nil 
            if current_user.id == @journey.user_id
                return true 
            else 
                false 
            end
        end
    end

    def other_user(journey)
        if @journey != nil 
            if @journey.user_id != current_user.id 
                return true 
            else 
                false 
            end
        end
    end

    def email_striper(email)
        username = email.split(/@gmail.com/)
        username[0]
    end

   
end


 
