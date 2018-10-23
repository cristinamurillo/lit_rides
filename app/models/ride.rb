class Ride < ApplicationRecord
    belongs_to :driver, foreign_key: 'driver_id', class_name: 'User'

    has_many :passenger_rides, foreign_key: 'ride_id', class_name: 'PassengerRide'
    has_many :passengers, through: :passenger_rides
    #set up join table and has many relationship.... ya
    

    has_many :reviews 

    # def ride_display
    #     "#{self.departure} \n#{self.destination} \n#{self.time.strftime('%B %e')}"
    # end
end

# .strftime("%B %e")
