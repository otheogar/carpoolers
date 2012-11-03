class AddDefaultValueToAvailibilty < ActiveRecord::Migration
  def change
	change_column :trips, :availibilty, :integer, :default => 1
  end
end
