class Trip < ActiveRecord::Base
  attr_accessible :date, :flag, :from_latitude, :from_longitude, :from_string, :time, :to_latitude, :to_longitude, :to_string
end
