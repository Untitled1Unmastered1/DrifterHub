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
    end

    def self.ranked_miles 
        journeys = Journey.order("miles DESC")
        return journeys
    end
end

    


end
