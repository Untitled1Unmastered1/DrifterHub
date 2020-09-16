class JourneysController < ApplicationController
    before_action :logged_in? 
    before_action :current_journey, only: [:show, :edit, :update, :destroy] 

    def index
        @journeys = Journey.all 
    end

    def new
        @journey = Journey.new 
    end

    def create
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

    def show
    end

    def edit
        unless @journey.user_id == current_user.id
            flash[:error] = "You cannot edit or delete this because you did not create it!"
            redirect_to journeys_path
        end
    end


    def update
        if @journey.update(journey_params)
            redirect_to journey_path(@journey)
        else 
            flash[:error] = "Please fill out all portions of Journey"
            render :edit 
        end
    end

    def destroy
        if current_user 
            @journey.destroy 
            redirect_to journeys_path
        end
    end

    private

    def journey_params
        params.require(:journey).permit(:title, :date, :miles, :location, :description)
    end


end
