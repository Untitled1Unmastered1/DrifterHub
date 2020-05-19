class ApplicationController < ActionController::Base
    helper_method :current_user, :welcome, :logged_in?, :require_login

    def welcome
        
    end

    # def logged_in?
    #     !!current_user
    # end

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    # def require_login
    #     if !logged_in? 
    #         flash[:error] = "To access this page you must first login."
    #         redirect_to root_path 
    #     end
    # end

    def logged_in?
        if !current_user
            flash[:error] = "To access this page you must first login."
            redirect_to root_path
        end
    end
end
