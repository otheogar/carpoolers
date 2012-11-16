class TripsConnect < ActiveRecord::Base
  attr_accessible :other_id, :trip_id
  belongs_to :trip, :foreign_key => :id, :primary_key => :id, :inverse_of => :trip_connect 
end
