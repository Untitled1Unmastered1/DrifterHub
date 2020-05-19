class CommentsController < ApplicationController

    before_action :logged_in?, only: [:new, :create, :show]

    def new
        @comment = Comment.new 
    end

    def create 

    end

    def show 
    end

    private 

    def comment_params
        params.require(:comment).permit(:content, :user_id, :journey_id)
    end
end
