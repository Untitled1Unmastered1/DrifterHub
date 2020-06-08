class User < ApplicationRecord

    has_many :journeys  
    has_many :comments
    has_many :commented_journeys, through: :comments, source: :journey 

    has_secure_password 

    validates :username, presence: true 
    validates :username, uniqueness: {message: "Username already in use, please try again." }
    

    

    

end
