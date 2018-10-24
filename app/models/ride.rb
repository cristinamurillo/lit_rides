class Ride < ApplicationRecord
    belongs_to :driver, foreign_key: 'driver_id', class_name: 'User'

    has_many :passenger_rides, foreign_key: 'ride_id', class_name: 'PassengerRide'
    has_many :passengers, through: :passenger_rides
    #set up join table and has many relationship.... ya


    has_many :reviews

    # def ride_display
    #     "#{self.departure} \n#{self.destination} \n#{self.time.strftime('%B %e')}"
    # end

    def self.search(search)
      if search
        rides = Ride.select {|ride| ride.departure == search}
        # if departure
        #   self.where(departure: departure)
        if rides != []
          # byebug
          rides
        else
        # flash[:errors] = ["There are no rides from that departure"]
        # byebug
        Ride.all
        end
      else
        Ride.all
      end
    end
end

# .strftime("%B %e")
