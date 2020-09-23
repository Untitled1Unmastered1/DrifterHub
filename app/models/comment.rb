class Comment < ApplicationRecord
    validates :content, presence: true 
    belongs_to :user 
    belongs_to :journey
    scope :most_recent, -> {Comment.order("created_at DESC")}#scope method to order comments, in descending order based 
    #off timestamp 


    def self.deleted_user#deletes a comment if the user no longer exists 
        Comment.all.each do |comment|
            if comment.user == nil
                comment.destroy 
            end
        end 
    end 


    def normalize_date#uses the strftime method to format the date of a comment month,day,year, time  
        self.created_at = created_at.strftime("%B %-d, %Y %-l:%M %p")
    end 

end
