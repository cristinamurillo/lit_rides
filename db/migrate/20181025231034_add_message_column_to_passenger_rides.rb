class AddMessageColumnToPassengerRides < ActiveRecord::Migration[5.2]
  def change
    add_column :passenger_rides, :message, :string
  end
end
