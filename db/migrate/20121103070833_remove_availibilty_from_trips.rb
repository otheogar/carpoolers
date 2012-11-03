class RemoveAvailibiltyFromTrips < ActiveRecord::Migration
  def up
    remove_column :trips, :availibilty
  end

  def down
    add_column :trips, :availibilty, :integer
  end
end
