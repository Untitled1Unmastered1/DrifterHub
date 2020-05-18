class SessionsController < ApplicationController

    def login 

    end

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            redirect_to new_session_path, alert: "User not found. Please login with the correct credentials."
        end
    end

    def destroy 
        session.delete :user_id 
        redirect_to root_path 
    end
end