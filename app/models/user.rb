class User < ApplicationRecord

    has_many :reviews 
    
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


    #validations
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :first_name, presence:true, length: {minimum: 2}
    validates :last_name, presence:true, length: {minimum: 2}
    validates :age, presence: true, numericality: {greater_than_or_equal_to: 18}


    #class and instance methods

    has_secure_password

    def full_name
      "#{self.first_name} #{self.last_name}"
    end

    def upcoming_drives
        self.drives.select do |drive|
            drive.time >= DateTime.now 
        end
    end

    def upcoming_rides 
        self.rides.select do |ride|
            ride.time >= DateTime.now 
        end
    end

    def past_drives
        self.drives.select do |drive|
            drive.time < DateTime.now 
        end
    end

    def past_rides
        self.rides.select do |ride|
            ride.time < DateTime.now 
        end
    end 

    def has_ride?(ride)
        self.past_rides.include?(ride)
    end


    # def driver_reviews
    #   self.drives.map do |drive|
    #     drive.reviews
    #   end
    # end

    #How do we add passengers to a ride?
    #How do we associate rides to travelers?
    #How do we associate reviews to travelers through rides?


    # def passenger_reviews
    #   self.rides.map do |ride|
    #     ride.reviews
    #   end
        # iterate through reviews to find the one associated with that specific passenger
    # end

end
