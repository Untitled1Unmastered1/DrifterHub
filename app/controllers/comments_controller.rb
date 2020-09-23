class CommentsController < ApplicationController
    before_action :logged_in?

    def new#get request for a new comment form, we also search for the journey this comment will be nested into, and 
        #set it to an instance @journey
        @comment = Comment.new 
        @journey = Journey.find_by_id(params[:journey_id])
    end

    def create#post request for a new comment
        @comment = Comment.new(content: params[:comment][:content], user_id: current_user.id, journey_id: params[:journey_id])
        if @comment.save
            redirect_to journey_comments_path(@comment.journey_id)
        end 
    end

    def index#get request for an index or thread of all comments submitted to that specific journey 
        if params[:journey_id] && journey = Journey.find_by(id: params[:journey_id]) 
            @comments = journey.comments.most_recent 
        else
            @comments = Comment.all
        end
    end
end
