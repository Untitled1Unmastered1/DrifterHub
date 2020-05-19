class CommentsController < ApplicationController

    before_action :logged_in?

    def new
        @comment = Comment.new 
        @journey = Journey.find_by_id(params[:journey_id])
    end

    def create 
        @comment = Comment.new(comment_params)
        if @comment.save
            redirect_to journey_comment_path 
        else 
            redirect_to new_journey_comment_path 
        end
    end

    def show 
        @comment = Comment.find_by_id(params[:journey_id][:comment])
    end


    private 

    def comment_params
        params.require(:comment).permit(content: params[:comment][:content], user_id: current_user.id, journey_id: params[:journey_id])
    end
end
