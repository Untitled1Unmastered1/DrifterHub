class CommentsController < ApplicationController

    before_action :logged_in?
    # before_action :current_journey, only: [:index]


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
        if params[:journey_id] && journey = Journey.find_by(id: params[:journey_id]) 
            @comments = journey.comments 
        else
            @comments = Comment.all
        end
    end


end
