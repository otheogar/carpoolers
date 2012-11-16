class AddOtherIdToTripsConnects < ActiveRecord::Migration
  def change
    add_column :trips_connects, :other_id, :string, :default=>""
    
  end
end
