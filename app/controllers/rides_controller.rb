class RidesController < ApplicationController

  def index
    #date filter (search by date)
    if params[:date]
      ride_dates = Ride.date_filter(params[:date])
      @rides = Ride.date_filter(params[:date])
    end

    if params[:search]
      ride_search = Ride.search(params[:search])
      @rides = Ride.search(params[:search])
    end

    if ride_search && ride_dates
      @rides = ride_dates & ride_search
    end

    if @rides == nil
      # flash[:message] = "nope"
      @rides = Ride.all
    end


    params.delete :search
    params.delete :date
  end

  def show
    set_ride
  end

  def new
    @ride = Ride.new
  end

  def travelers
    set_ride
    # @review = Review.new 
  end

  def create
    @ride = Ride.new(ride_params)
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
  end

  def update
    set_ride
    if @ride.update
      redirect_to ride_path(@ride)
    else
      set_ride
      render :edit
    end
  end

  def destroy
  end

  private

  def set_ride
    @ride = Ride.find(params[:id])
  end

  def ride_params
    ride = params[:ride]
    time = DateTime.new(ride["time(1i)"].to_i, ride["time(2i)"].to_i, ride["time(3i)"].to_i, ride["time(4i)"].to_i, ride["time(5i)"].to_i)
    params[:ride][:time] = time
    params.require(:ride).permit(:departure, :destination, :time, :duration, :cost, :available_seats)
  end

end
