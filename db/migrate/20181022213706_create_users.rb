class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :car_type
      t.string :about_me
      t.boolean :smoking
      t.boolean :pets
      t.integer :engagement

      t.timestamps
    end
  end
end
