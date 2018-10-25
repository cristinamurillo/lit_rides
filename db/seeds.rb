require 'faker'

User.destroy_all
Ride.destroy_all
PassengerRide.destroy_all
Review.destroy_all


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

50.times do 
  Review.create(
    title: Faker::Hipster.sentence,
    rating: Faker::Number.between(1, 5),
    content: Faker::Hipster.paragraph,
    ride_id: Faker::Number.between(1, 40)
  )
end


puts "hi"
