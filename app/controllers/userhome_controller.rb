class UserhomeController < ApplicationController
  def index
  @trips_passengers = Trip.where("flag = ?", 1)
  @trips_drivers = Trip.where("flag = ?", 0)

  end
  def search
    trips_passengers_result = Array.new;
    trips_drivers_result = Array.new;
   search_date_formatted = Date.parse(params[:search_date])
   # render :text => search_date_formatted
    if (params[:role] == "driver")
      trips_passengers_result = Trip.where("from_string = ? AND to_string = ? AND flag =? AND date >= ?", params[:search_from], params[:search_to], 1, search_date_formatted)
    else
      trips_drivers_result = Trip.where("from_string = ? AND to_string = ? AND flag  = ?", params[:search_from], params[:search_to],0)

    end
    feed = ((params[:role] == "driver") ? 0:1)
    respond_to do |format|
      format.html { redirect_to(userhome_url) }
      format.js do
        render "search_d", :locals => {:trip_passengers_list => trips_passengers_result, :trip_drivers_list => trips_drivers_result, :updated_feed => feed}
      end
    end
  end

  def reload_feed
    @trips_passengers = Trip.where("flag = ?", 1)
    @trips_drivers = Trip.where("flag = ?", 0)
  respond_to do |format|
   format.html { redirect_to(userhome_url) }  
      format.js do
        render "reload_feed", :locals => {:trip_passengers_list => trips_passengers_result, :trip_drivers_list => trips_drivers_result}
      end
   end
  end
end
