class FeedController < ApplicationController
  before_filter :authorize

  def index
  @trips_passengers = Trip.where("flag = ?", '1')
  @trips_drivers = Trip.where("flag = ?", '0')
  end
end
