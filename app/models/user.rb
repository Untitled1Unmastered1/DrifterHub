class User < ApplicationRecord
    has_many :journeys  
    has_many :comments
    has_many :commented_journeys, through: :comments, source: :journey 
    has_secure_password #authenticate, validate password &/or password confirmation
end
