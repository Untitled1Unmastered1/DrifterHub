class SessionsController < ApplicationController

    def login#get request for login form 
    end


    def create#post request for a new session 
        @user = User.find_by(username: params[:user][:username])

        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to journeys_path 
        else 
            flash[:error] = "User not found. Please login with the correct credentials."
            redirect_to login_path 
        end
    end

    def destroy#destroys current session 
        session.delete :user_id 
        redirect_to root_path 
    end

    def omniauth#omniauth for google sign in
        @user = User.find_or_create_by(uid: auth[:uid]) do |u|
            u.username = email_striper(auth[:info][:email])
            u.password = SecureRandom.hex
        end

        session[:user_id] = @user.id
        redirect_to journeys_path 
        
    end

    private
        def auth 
            request.env['omniauth.auth']
        end
end