class ApplicationController < ActionController::Base
    helper_method :current_user, :welcome, :logged_in? 

    def welcome
        current_user 
    end

    def logged_in?
        !!current_user
    end

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end
end
