class User < ApplicationRecord
    has_many :rides
    has_many :reviews, through: :rides 

    has_many :driver_relationships, foreign_key: :driver_id, class_name: 'Ride'
    has_many :drivers, through: :driver_relationships, source: :driver 
    
    has_many :passenger_relationships, foreign_key: :passenger_id, class_name: 'Ride'
    has_many :passengers, through: :passenger_relationships, source: :passenger 


end
