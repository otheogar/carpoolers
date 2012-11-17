class MytripsController < ApplicationController
  before_filter :authorize
  
  def index
	@trips_passengers = Trip.where(cond+"flag = ? and availabilty > 0", 1).limit(20).order("updated_at desc")
    @trips_drivers = Trip.where(cond+"flag = ? and availabilty > 0", 0).limit(20).order("updated_at desc")
  end
  
  def fetch_mytrips
	@my_trips_as_driver = Array.new;
	@my_trips_as_passenger = Array.new;
	@my_trips_as_driver = Trip.where("owner_id = ? AND flag =?",params[:user_id],0)
	@my_trips_as_passenger = Trip.where("owner_id = ? AND flag =?",params[:user_id],1)
	respond_to do |format|
      format.js do
        render "fetch_mytrips", :locals => {:my_trips_as_passenger_list => @my_trips_as_passenger, :my_trips_as_driver_list => @my_trips_as_driver}
      end
    end
  end
  
  def delete_trip
	
	@trip_to_delete = Trip.find(params[:trip_id])
	@flag = params[:flag]
	availabilty = @trips_connect.availabilty
	#if there are no passengers in the trip,the driver can delete the trip
	#flag = ?? for driver
	#check for all the cases
	#implement disconnect
	if(availabilty == 1 && flag == 1 )
		@trip_to_delete.destroy
	
	  respond_to do |format|
	format.html { redirect_to(fetch_mytrips_url) }
	format.json { head :no_content }
	end
	end
  end
end