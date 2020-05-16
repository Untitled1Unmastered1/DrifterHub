class SessionsController < ApplicationController

    def login 

    end

    def create 
        if !params[:username].empty? 
            session[:username] = params[:username]
            redirect_to root_path 
        else 
            redirect_to login_path 

        end
    end

    def destroy 
        session.delete :user_id 
        redirect_to '/'
    end
end