class Ride < ApplicationRecord
    belongs_to :driver, foreign_key: 'driver_id', class_name: 'User'

    has_many :passenger_rides, foreign_key: 'ride_id', class_name: 'PassengerRide'
    has_many :passengers, through: :passenger_rides
    #set up join table and has many relationship.... ya


    has_many :reviews 

    def has_seats?
      self.available_seats < self.passengers.count
    end


    def self.date_filter(date)

       user_search_date = Date.new(date["(1i)"].to_i, date["(2i)"].to_i, date["(3i)"].to_i)
       rides = Ride.select{|ride| user_search_date == ride.time.to_date}

    end

    def self.search(search)
      if search
        rides = Ride.select do |ride|
          ride.departure.downcase.include?(search.downcase)
          # byebug
        end
        if rides != []
          rides
        else
          return nil
        end
      else
        Ride.all
      end
    end
    
end

#helper methods

def upcoming_rides(rides)
  rides.select do |ride|
    ride.time >= DateTime.now 
  end
end
