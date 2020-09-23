class Journey < ApplicationRecord
  validates :title, :date, :miles, :location, :description, presence: true#validations for journey objects before being 
  #persisted to the db 
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments 
  

    def self.deleted_user#deletes any journey whos user has been deleted 
        Journey.all.each do |journey|
            if journey.user == nil 
                journey.destroy
            end
        end
    end


    def self.ranked_miles#scope method, ranks journeys by its miles, in descending order 
        journeys = Journey.order("miles DESC")
        journeys 
    end

end

    


