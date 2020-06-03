class Journey < ApplicationRecord
  validates :title, :date, :miles, :location, :description, presence: true 
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments 

  def self.deleted_user
    Journey.all.each do |journey|
        if journey.user == nil 
            journey.comments.each do |c|
                c.destroy
            end
            journey.destroy 
        end
    end #test if we can eliminate the comment deletion function, since the show page does not render comments anymore 

    def self.ranked_miles 
        journeys = Journey.order("miles DESC")
        return journeys #can i use validation for this to only include integers 
    end
end

    


end
