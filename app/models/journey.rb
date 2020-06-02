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
end

    
#scope method that returns your journeys in descending order by the number of miles
#view page 
#route that render that view page 
#review scope methods, review how to render data from scope method to show page 

end
