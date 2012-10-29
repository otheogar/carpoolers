class UserhomeController < ApplicationController
  def index
  @trips_passengers = Trip.where("flag = ?", 1)
  @trips_drivers = Trip.where("flag = ?", 0)

  end
  def search
  @found_trips = Trip.where("from_string = ? AND to_string", search_from, search_to)
  respond_to do |format|
   format.html { redirect_to(home_url) }
   format.js   {  } 
   end
  end
end
