class JourneysController < ApplicationController
    before_action :logged_in? 
    before_action :current_journey, only: [:show, :edit, :update, :destroy] 

    def index#controller action, get request for all journeys 
        @journeys = Journey.all 
    end

    def new#controller action, get request for a new journey form 
        @journey = Journey.new 
    end

    def create#controller action, post request which persists journey object to db 
        @journey = Journey.new(journey_params)
        @journey.user_id = session[:user_id]
        if @journey.valid?
            @journey.save 
            redirect_to journey_path(@journey)
        else
            flash[:error] = "Please fill out all portions of the form."
            render :new 
        end
    end

    def show#controller action, get request to show specific instance of journey 
    end

    def edit#controller action, get request for edit form 
        unless @journey.user_id == current_user.id
            flash[:error] = "You cannot edit or delete this because you did not create it!"
            redirect_to journeys_path
        end
    end


    def update#controller action, patch request to update a journey
        if @journey.update(journey_params)
            redirect_to journey_path(@journey)
        else 
            flash[:error] = "Please fill out all portions of Journey"
            render :edit 
        end
    end

    def destroy#controller action, delete request, deletes object from db 
        if current_user 
            @journey.destroy 
            redirect_to journeys_path
        end
    end

    private

    def journey_params#We want to make sure that when users submit a form we only let the fields we want submit 
        params.require(:journey).permit(:title, :date, :miles, :location, :description)
    end


end
