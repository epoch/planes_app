class CreatePlanes < ActiveRecord::Migration
  def change
    create_table :planes do |t|
      t.string :model

      t.timestamps
    end
  end
end
