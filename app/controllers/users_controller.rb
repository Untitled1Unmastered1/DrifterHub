class UsersController < ApplicationController

    before_action :logged_in?, only: [:show, :edit, :update, :destroy] #before any of these actions, make sure user is 
    #logged_in.

    def new
        @user = User.new
    end

    def create 
          @user = User.new(user_params)
          if @user.save
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
          else 
            redirect_to new_user_path #may have to add @user as an argument if this doesnt work 
          end
    end

    def show

    end

    def edit 

    end

    def update
      @user = User.find(params[:id])
      if @user.valid?
        @user.update(username: params[:user][:username])
        redirect_to user_path(@user)
      else 
        redirect_to edit_user_path #may have to add @user as an argument if this doesnt work 
      end
    end

    def destroy 
      @user = User.find_by_id(params[:id])
      @user.destroy 
      redirect_to root_path 
      flash[:error] = "Account deleted."
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
