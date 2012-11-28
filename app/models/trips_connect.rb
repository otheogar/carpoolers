class TripsConnect < ActiveRecord::Base
  attr_accessible :other_id, :trip_id
  belongs_to :trip, :foreign_key => :trip_id, :primary_key => :id, :inverse_of => :trip_connect
  belongs_to :user_profile, :foreign_key => :other_id,  :primary_key => :user_uid, :inverse_of => :trip_connect
end
