class PassengerRide < ApplicationRecord
    belongs_to :ride 
    belongs_to :passenger, foreign_key: 'passenger_id', class_name: 'User'

    def driver 
        ride.driver 
    end
    
end
