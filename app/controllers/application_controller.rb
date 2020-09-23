class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :validate, :email_striper, :current_journey

    
    def current_user #the current_user method when invoked will either return the @current_user instance variable
        #or will be equal to the second half which finds and returns the user based on the session id. 
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

    def email_striper(email)#specifically used for omniauth, essentially this method is stripping a part of the email
        #address to format a username 
        username = email.split(/@gmail.com/)
        username[0] 
    end

    def current_journey#sets current journey 
        @journey = Journey.find_by_id(params[:id])
    end

end


 
