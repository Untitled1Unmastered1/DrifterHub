class Comment < ApplicationRecord
    belongs_to :user 
    belongs_to :journey 


    def self.deleted_user
        Comment.all.each do |comment|
            if comment.user == nil
                comment.destroy 
            end
        end 
    end 



end
