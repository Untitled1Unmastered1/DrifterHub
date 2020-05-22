class User < ApplicationRecord

    has_many :journeys  
    has_many :comments
    has_many :commented_journeys, through: :comments, source: :journey 

    has_secure_password #authenticate, validate password &/or password confirmation

    validates :username, presence: true 
    validates :username, uniqueness: {message: "Username already in use, please try again." }

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

    # def self.current_user_posts

    # end

end
