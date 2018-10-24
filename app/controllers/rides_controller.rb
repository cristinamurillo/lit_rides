class RidesController < ApplicationController

  def index
    @rides = Ride.search(params[:search])
  end

  def show
    set_ride
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(ride_params)
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
