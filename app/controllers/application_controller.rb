class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :validate, :owned_by_user?, :email_striper, :current_journey

    
    def current_user #setting the instance of @current_user to whatever user is currently in the session 
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?#in ruby there are no methods where you can ask if an object is true or false, however if
        # we double negate something i.e. use 2 boolean operators(!!) it will esentially be the same. 
        !!current_user
    end


    def validate #validation to make sure a user can edit a journey or profile. if the user_id is not the one in the current
        #sessions hash then they will receive a flash error and be redirected to the main page(journeys index)
        unless @user.id == current_user.id 
            flash[:error] = "Restricted area."
            redirect_to journeys_path
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


 
