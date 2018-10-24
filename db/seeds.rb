require 'faker'

User.destroy_all
Ride.destroy_all
PassengerRide.destroy_all
Review.destroy_all

# hanaa = User.create(first_name:"Hanaa", last_name: "Sadoqi", email: "hana@gmail.com", password: "hello", age: 24)
# cristina = User.create(first_name:"Cristina")
# chris = User.create(first_name:"Chris")
# raj = User.create(first_name:"Raj")
# arren = User.create(first_name:"Arren")
# helen = User.create(first_name:"Helen")
# graham = User.create(first_name:"Graham")
#
#
# ca = Ride.create(driver: hanaa, destination: "California", departure: "New York", time: DateTime.now)
# fl = Ride.create(driver: hanaa, destination: "Florida", departure: "Texas", time: DateTime.now)
# mn = Ride.create(driver: hanaa, destination: "Minnesota", departure: "Baltimore", time: DateTime.now)
#
#
# PassengerRide.create(passenger: arren, ride: mn)
# PassengerRide.create(passenger: graham, ride: mn)
# PassengerRide.create(passenger: graham, ride: ca)
# PassengerRide.create(passenger: raj, ride: ca)
# PassengerRide.create(passenger: chris, ride: fl)
# PassengerRide.create(passenger: helen, ride: fl)
# PassengerRide.create(passenger: hanaa, ride: fl)
#
# Review.create(rating: 5, ride_id: ca.id)
# Review.create(rating: 4, ride_id: ca.id)
# Review.create(rating: 4, ride_id: fl.id)

20.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password_digest: BCrypt::Password.create('etsy'),
    age: Faker::Number.between(18, 55),
    car_type: Faker::Vehicle.make_and_model,
    about_me: Faker::Lorem.paragraph,
    smoking: Faker::Boolean,
    pets: Faker::Boolean,
    engagement: Faker::Number.between(1, 3)
  )
end

40.times do
  Ride.create(
    departure: "#{Faker::Address.city}, #{Faker::Address.state}",
    destination: "#{Faker::Address.city}, #{Faker::Address.state}",
    time: Faker::Time.between(1.year.ago, 1.year.from_now),
    cost: Faker::Number.between(1, 100),
    available_seats: Faker::Number.between(1, 5),
    driver_id: Faker::Number.between(1, 10)
  )
end

60.times do
  PassengerRide.create(
    passenger_id: Faker::Number.between(11, 20),
    ride_id: Faker::Number.between(1, 40)
  )
end


puts "hi"
