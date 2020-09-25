class CommentedJourneysController < ApplicationController


    def index
        @user = User.find_by_id(params[:id])
        validate 
        @commented_journeys = @user.commented_journeys.uniq#iterates through the array without changing it and returning
        #unique elements, in the event that a user commented twice on the same post. to avoid having that post be displayed
        #twice in the index view for commented_journeys 
    end

end