class Trip < ActiveRecord::Base
  attr_accessible :date, :flag, :from_latitude, :from_longitude, :from_string, :time, :to_latitude, :to_longitude, :to_string, :availabilty, :owner_id

  belongs_to :user_profile, :foreign_key => :owner_id,  :primary_key => :user_uid, :inverse_of => :trip
  has_many :trip_connect, :foreign_key => :trip_id, :primary_key => :id, :inverse_of => :trip
end
