class CreatePassengerRides < ActiveRecord::Migration[5.2]
  def change
    create_table :passenger_rides do |t|
      t.integer :passenger_id
      t.integer :ride_id

      t.timestamps
    end
  end
end
