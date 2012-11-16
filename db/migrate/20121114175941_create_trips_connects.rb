class CreateTripsConnects < ActiveRecord::Migration
  def change
    create_table :trips_connects do |t|
      t.integer :trip_id
      t.integer :other_id

      t.timestamps
    end
  end
end
