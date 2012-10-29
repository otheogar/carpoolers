class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :from_string
      t.string :to_string
      t.float :from_longitude
      t.float :from_latitude
      t.float :to_longitude
      t.float :to_latitude
      t.date :date
      t.time :time
      t.integer :flag

      t.timestamps
    end
  end
end
