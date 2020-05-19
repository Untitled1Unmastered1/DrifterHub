class JourneysController < ApplicationController
    before_action :logged_in?, only: [:new, :create, :index, :destroy]

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
            redirect_to journeys_path 
        else 
            redirect_to new_journey_path 
        end
    end

    def show
        @journey = Journey.find_by_id(params[:id])
    end

    def edit
        @journey = Journey.find_by_id(params[:id])
    end


    def update
        @journey = Journey.find_by_id(params[:id])
        if @journey.valid? 
            @journey.save 
        else 
            redirect_to edit_journey_path 
        end
    end

    def destroy
        @journey = Journey.find_by_id(params[:id])
        if current_user 
            @journey.destroy 
            redirect_to journeys_path
        end
    end

    private

    def journey_params
        params.require(:journey).permit(:title, :date, :miles, :location, :description, :user_id)
    end
end
