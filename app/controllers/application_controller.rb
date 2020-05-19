class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :owned_by_user?

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

    def owned_by_user?(journey)
        if @journey != nil 
            if current_user.id == @journey.user_id
                return true 
            else 
                false 
            end
        end
    end
end


 # def require_login
    #     if !logged_in? 
    #         flash[:error] = "To access this page you must first login."
    #         redirect_to root_path 
    #     end
    # end

      # def logged_in?
    #     !!current_user
    # end
