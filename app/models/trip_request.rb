class TripRequest < ActiveRecord::Base
  attr_accessible :accepted_flag, :req_id, :trip_id
end
