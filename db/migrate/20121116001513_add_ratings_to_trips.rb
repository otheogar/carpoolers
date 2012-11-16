class AddRatingsToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :ratings, :integer, :default => 0
  end
end
