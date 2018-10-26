class PassengerRidesController < ApplicationController

  def leave_ride
    user_id = session[:user_id]
    ride_id = params[:ride_id].to_i
    ride = PassengerRide.all.find do |passenger_ride|
      passenger_ride.passenger_id == user_id && passenger_ride.ride_id == ride_id
    end
    ride.destroy
    redirect_to main_page_path
  end

end
