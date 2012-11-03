class CreateTripRequests < ActiveRecord::Migration
  def change
    create_table :trip_requests do |t|
      t.integer :req_id
      t.integer :trip_id
      t.integer :accepted_flag

      t.timestamps
    end
  end
end
