class RidesController < ApplicationController

  def index
    #date filter (search by date)
    # if params[:date]
    #   ride_dates = Ride.date_filter(params[:date])
    #   @rides = Ride.date_filter(params[:date])
    # end

    if params[:search]
      ride_search = Ride.search(params[:search])
      @rides = Ride.search(params[:search])
    end

    # if ride_search && ride_dates
    #   @rides = ride_dates & ride_search
    # end

    if @rides == nil
      # flash[:message] = "nope"
      
      @rides = Ride.all
      # upcoming_rides(@rides)
    end

    @rides = upcoming_rides(@rides)


    params.delete :search
    # params.delete :date
  end

  def apply
    set_ride
  end

  def add_passenger
    @user = User.find(logged_in_user_id)
    @ride = set_ride #set_ride as before_action
    @passenger_ride = PassengerRide.create(passenger_id: @user.id, ride_id: @ride.id, message: params[:message])
    @ride.available_seats -= 1
    @ride.save
    # @passenger_ride.message = params[:message]
    redirect_to "/users/#{logged_in_user_id}/main_page"
  end

  

  def show
    set_ride
    @user = User.find(logged_in_user_id)
  end

  def new
    @ride = Ride.new
    @user_id = session[:user_id]
  end

  def travelers
    set_ride
    # @review = Review.new
  end



  def create
    @ride = Ride.new(ride_params)
    byebug
    @ride.driver_id = logged_in_user_id
    if @ride.valid?
      @ride.save
      redirect_to @ride
    else
      render :new
    end
  end

  def edit
    set_ride
    @user_id = session[:user_id]
  end

  def update
    set_ride
    if @ride.update(ride_params)
      redirect_to ride_path(@ride)
    else
      set_ride
      render :edit
    end
  end

  def destroy
    set_ride
    @ride.destroy
    redirect_to @ride.driver
  end

  private

  def set_ride
    @ride = Ride.find(params[:id])
  end

  def ride_params

    params.require(:ride).permit(:departure, :destination, :time, :duration, :cost, :driver_id, :available_seats)

  end

end
