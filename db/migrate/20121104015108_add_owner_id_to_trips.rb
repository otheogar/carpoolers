class AddOwnerIdToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :owner_id, :string

    add_index "trips", ["owner_id"], :name => "index_trips_on_owner_id"

end
