class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :email_striper, :owned_by_user?

    
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        !!current_user
    end


    def validate 
        unless @user.id == current_user.id 
            flash[:error] = "Restricted area."
            redirect_to journeys_path
        end
    end

    def owned_by_user?(journeys) #improve this, or scrap it. see created_by_user in journeys controller 
        if @journey != nil 
            if current_user.id == @journey.user_id
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


 
