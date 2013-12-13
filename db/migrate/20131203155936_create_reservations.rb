class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :passenger_id
      t.integer :flight_id
      t.integer :seat_id

      t.timestamps
    end
  end
end
