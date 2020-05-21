class SessionsController < ApplicationController

    def login
    
    end


    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to journeys_path(@user)
        else 
            flash[:error] = "User not found. Please login with the correct credentials."
            redirect_to login_path 
        end
    end

    def destroy 
        session.delete :user_id 
        redirect_to root_path 
    end
end