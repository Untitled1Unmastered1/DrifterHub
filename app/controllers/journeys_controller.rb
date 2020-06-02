class JourneysController < ApplicationController
    before_action :logged_in?, only: [:new, :create, :index, :destroy]
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
            redirect_to new_journey_path 
        end
    end

    def show
    end

    def edit
        validate 
    end


    def update
        if @journey.update(journey_params)
            redirect_to journey_path(@journey)
        else 
            redirect_to edit_journey_path 
        end
    end

    def destroy
        if current_user 
            @journey.destroy 
            redirect_to journeys_path
        end
    end

    def created_by_current_user
        unless @journey.user_id == current_user.id 
            flash[:danger] = "You cannot edit or delete this because you did not create it!"
            redirect_to journeys_path
        end
    end

    private

    def journey_params
        params.require(:journey).permit(:title, :date, :miles, :location, :description)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

    # def current_journey
    #     @journey = Journey.find_by_id(params[:id])
    # end
end
