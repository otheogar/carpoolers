class RemoveOtherIdFromTripsConnects < ActiveRecord::Migration
  def up
    remove_column :trips_connects, :other_id
  end

  def down
    add_column :trips_connects, :other_id, :integer
  end
end
