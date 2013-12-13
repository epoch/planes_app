class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :number
      t.integer :plane_id

      t.timestamps
    end
  end
end
