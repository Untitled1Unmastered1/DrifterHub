class Comment < ApplicationRecord
    belongs_to :user 
    belongs_to :journey
    # before_validation :current_date
    scope :most_recent, -> {Comment.order("created_at DESC")}


    def self.deleted_user
        Comment.all.each do |comment|
            if comment.user == nil
                comment.destroy 
            end
        end 
    end 

    def self.current_date
        Comment.created_at = created_at.strftime("%B %-d, %Y %-l:%M %p")
    end #need to fix this you are so close

    


end
