class CommentedJourneysController < ApplicationController

    def index
        @user = User.find_by_id(params[:id])
        @commented_journeys = @user.commented_journeys 
    end

end