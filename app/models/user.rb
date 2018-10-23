class User < ApplicationRecord

    has_many :drives, foreign_key: 'driver_id', class_name: 'Ride'

    has_many :passenger_rides, foreign_key: :passenger_id, class_name: 'PassengerRide'
    has_many :rides, through: :passenger_rides, source: :ride

    #all the passengers a user has driven
    has_many :passengers, -> {distinct}, through: :drives 
    #all the drivers that have driven a user 
    has_many :drivers, -> {distinct}, through: :rides 
   
    
    #reviews of the passenger by a driver 
    # has_many :passenger_reviews, through: :rides, source: :reviews 

    # #reviews of the driver by passengers
    # has_many :driver_reviews, through: :drives, source: :reviews 



    
  

    


end
