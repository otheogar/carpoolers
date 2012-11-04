class UserhomeController < ApplicationController
  before_filter :authorize

  def index
  @trips_passengers = Trip.where("flag = ? and availabilty > 0", 1).order("updated_at desc")
  @trips_drivers = Trip.where("flag = ? and availabilty > 0", 0).order("updated_at desc")
  @passenger_last_update = @trips_passengers.at(0).updated_at;
  @driver_last_update = @trips_drivers.at(0).updated_at;
  end

  def search
    trips_passengers_result = Array.new;
    trips_drivers_result = Array.new;
   search_date_formatted = Date.parse(params[:search_date])
   # render :text => search_date_formatted
    if (params[:role] == "passenger")
      trips_passengers_result = Trip.where("from_string = ? AND to_string = ? AND flag =? AND date >= ?", params[:search_from], params[:search_to], 1, search_date_formatted)
    else
      trips_drivers_result = Trip.where("from_string = ? AND to_string = ? AND flag  = ? AND date >= ?", params[:search_from], params[:search_to],0, search_date_formatted)

    end
    feed = ((params[:role] == "driver") ? 0:1)
    respond_to do |format|
      format.js do
        render "search_d", :locals => {:trip_passengers_list => trips_passengers_result, :trip_drivers_list => trips_drivers_result, :updated_feed => feed}
      end
    end
  end

  def reload_feed
    @trips_passengers = Trip.where("flag = ?", 1).order("updated_at desc")
    @trips_drivers = Trip.where("flag = ?", 0).order("updated_at desc")
   respond_to do |format|
      format.js do
        render "reload_feed", :locals => {:trip_passengers_list => @trips_passengers, :trip_drivers_list => @trips_drivers}
      end
   end
  end
  
  def connect
	
	@trips_connect = Trip.find(params[:trip_id])
	availabilty = @trips_connect.availabilty
	if(availabilty > 0)
	availabilty=availabilty - 1;
	@trips_connect.update_attribute(:availabilty, availabilty )
	  respond_to do |format|
	format.html { redirect_to(userhome_url) }
	format.json { head :no_content }
	end
	end
  end
	
	
	

  def fetch_new
     passenger_new_updates = Trip.where("updated_at > ? AND flag = ? and availabilty > 0",Time.parse(params[:passenger_update])+2 ,1).order("updated_at desc")
     drivers_new_updates = Trip.where("updated_at > ? AND flag = ? and availabilty > 0",Time.parse(params[:driver_update])+2,0).order("updated_at desc")

     #render :text => passenger_new_updates.at(0).updated_at
     respond_to do |format|
       format.js do
         render "fetch_new", :locals => {:new_passengers => passenger_new_updates, :new_drivers => drivers_new_updates}
       end
       end
  end
end
