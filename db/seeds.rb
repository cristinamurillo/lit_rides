User.destroy_all
Ride.destroy_all
PassengerRide.destroy_all
Review.destroy_all

hanaa = User.create(first_name:"Hanaa")
cristina = User.create(first_name:"Cristina")
chris = User.create(first_name:"Chris")
raj = User.create(first_name:"Raj")
arren = User.create(first_name:"Arren")
helen = User.create(first_name:"Helen")
graham = User.create(first_name:"Graham")


ca = Ride.create(driver: cristina, destination: "California")
fl = Ride.create(driver: arren, destination: "Florida")
mn = Ride.create(driver: hanaa, destination: "Minnesota")


PassengerRide.create(passenger: arren, ride: mn)
PassengerRide.create(passenger: graham, ride: mn)
PassengerRide.create(passenger: graham, ride: ca)
PassengerRide.create(passenger: raj, ride: ca)
PassengerRide.create(passenger: chris, ride: fl)
PassengerRide.create(passenger: helen, ride: fl)
PassengerRide.create(passenger: hanaa, ride: fl)

Review.create(rating: 5, ride_id: ca.id)
Review.create(rating: 4, ride_id: ca.id)
Review.create(rating: 4, ride_id: fl.id)



puts "hi"
