class UsersController < ApplicationController

    before_action :find_user, only: [:show, :edit, :update, :destroy]
    before_action :validate, only: [:update, :destroy]

    
    def new#controller action, get request for a new user form
        @user = User.new
    end

    def create #controller action, post request which persists user object to db
          @user = User.new(user_params)
          if @user.save
            session[:user_id] = @user.id 
            redirect_to journeys_path(@user)
          else 
            flash[:error] = "Username is not available, please try again."
            render :new 
          end
    end
    
    def show# finding the user, and validating that the user can see said profile if it belongs to them 
      validate
    end
    
    def edit#get request for an edit form, validating to make sure the user requesting the edit form is the current user
      validate 
    end

    def update#patch request to update user settings 
      if @user.valid?
        @user.update(username: params[:user][:username])
        redirect_to user_path(@user)
      else
        render :edit 
      end
    end

    def destroy#delete request to deactivate users account 
      @user.destroy 
      redirect_to root_path 
      flash[:error] = "Account deleted."
    end

    private

    def user_params#We want to make sure that when users submit a form we only let the fields we want submit
      params.require(:user).permit(:username, :password)
    end

    def find_user#finds user based on the user id in the params hash and sets it to an instance variable of @user 
      @user = User.find_by_id(params[:id])
    end

end
