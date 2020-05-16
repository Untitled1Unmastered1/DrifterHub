class User < ApplicationRecord

    has_secure_password #authenticate, validate password &/or password confirmation
    validates :username, uniqueness: {message: "Username already in use, please try again." }


    has_many :journeys  
    has_many :comments
    has_many :commented_journeys, through: :comments, source: :journey 
end
