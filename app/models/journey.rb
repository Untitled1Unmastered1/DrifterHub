class Journey < ApplicationRecord
  validates :title, :date, :miles, :location, :description, presence: true 
  validates :miles, numericality: { only_integer: true }
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments 

    def self.deleted_user
        Journey.all.each do |journey|
            if journey.user == nil 
                journey.destroy
            end
        end
    end


    def self.ranked_miles 
        journeys = Journey.order("miles DESC")
        return journeys #can i use validation for this to only include integers 
    end
end

    


