class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :departure
      t.string :destination
      t.datetime :time
      t.time :duration
      t.integer :cost
      t.integer :available_seats
      # t.integer :passenger_id
      t.integer :driver_id

      t.timestamps
    end
  end
end
