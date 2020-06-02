class CommentsController < ApplicationController

    before_action :logged_in?


    def new
        @comment = Comment.new 
        @journey = Journey.find_by_id(params[:journey_id])
    end

    def create 
        @comment = Comment.new(content: params[:comment][:content], user_id: current_user.id, journey_id: params[:journey_id])
        if @comment.save
            redirect_to journey_path(@comment.journey_id)
        end 
    end

    def show 
        @comment = Comment.find_by_id(params[:journey_id][:comment])
    end

    def index
        @comments = Comment.all 
    end

end
