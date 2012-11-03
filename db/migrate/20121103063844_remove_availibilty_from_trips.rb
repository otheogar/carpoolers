class RemoveAvailibiltyFromTrips < ActiveRecord::Migration
  def up
  end

  def down
	remove_column :trips, :availibilty, :integer
  end
end
