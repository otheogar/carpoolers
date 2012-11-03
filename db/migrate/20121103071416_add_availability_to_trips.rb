class AddAvailabilityToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :availabilty, :integer, :default => 1
  end
end
