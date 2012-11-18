class UserhomeController < ApplicationController
  before_filter :authorize

  def get_homebase_cond
    lat=session[:homelat]
    lng= session[:homelong]
    cond=""
    if !lat.nil? && !lng.nil?
      cond="from_latitude < (#{lat}+0.1) and from_latitude>(#{lat}-0.1) and from_longitude < (#{lng}+0.5) and from_longitude>(#{lng}-0.5) and "
    end
    cond
  end


  def index
    if session[:homestr].nil?
      @homebase=UserProfile.find_by_email(user_email);
      @str=@homebase.home_string;
      session[:homestr]=@str;
      session[:homelat]=@homebase.home_latitude
      session[:homelong]=@homebase.home_longitude
    end

    get_lists
    @messages = Message.where("owner_id = ?", user_id).order("created_at desc")
    @count = @messages.where("read =?",0).count

  end

  def search

    session[:s_from]=params[:search_from]
    session[:s_to]=params[:search_to]
    session[:s_from_lat]=params[:from_lat]
    session[:s_from_long]=params[:from_long]
    session[:s_to_lat]=params[:to_lat]
    session[:s_to_long]=params[:to_long]
    session[:s_date]=params[:search_date]
    session[:s_role]=params[:role]


    #change this to allo user selection of radius - use default 15 miles
    r_from=15
    r_to=15
    trips_passengers_result = Array.new;
    trips_drivers_result = Array.new;
    search_date_formatted = Date.strptime(params[:search_date], '%m/%d/%Y')
    radius_cond_from = radius_from(params[:from_lat],params[:from_long])
    radius_cond_to = radius_to(params[:to_lat],params[:to_long])
    flag=0
    if (params[:role] == "passenger")
      flag=1
    end
    condition="SELECT *,"+radius_cond_from+","+radius_cond_to+ " FROM trips HAVING distancefrom < #{r_from} AND distanceto < #{r_to} AND date='#{search_date_formatted}' AND flag=#{flag} ORDER BY time LIMIT 20"

    #hack to work in SQLITE
    condition="SELECT * FROM trips WHERE date='#{search_date_formatted}' AND from_string='Chicago,IL' AND flag=#{flag} ORDER BY time LIMIT 20"
    #condition="SELECT * FROM trips WHERE from_string='Waltham, MA' AND flag=#{flag} ORDER BY time LIMIT 20"
    if (params[:role] == "passenger")
      trips_passengers_result = Trip.find_by_sql([condition])
    else
      trips_drivers_result =  Trip.find_by_sql([condition])
    end
    feed = ((params[:role] == "driver") ? 0:1)
    respond_to do |format|
      format.js do
        render "search_d", :locals => {:trip_passengers_list => trips_passengers_result, :trip_drivers_list => trips_drivers_result, :updated_feed => feed}
      end
    end
  end


  def get_lists
    cond=get_homebase_cond();
    @trips_passengers = Trip.where(cond+"flag = ? and availabilty > 0", 1).limit(20).order("updated_at desc")
    @trips_drivers = Trip.where(cond+"flag = ? and availabilty > 0", 0).limit(20).order("updated_at desc")
    @passenger_last_update = @trips_passengers.at(0).updated_at
    @driver_last_update = @trips_drivers.at(0).updated_at
  end

  def reload_feed

   get_lists
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
      #  format.html { redirect_to(userhome_url) }
        format.json { render :json => "1" }
      end
    else
      respond_to do |format|
        format.json { render :json => "0" }
      end
    end
  end




  def fetch_new
    cond=get_homebase_cond();
     passenger_new_updates = Trip.where(cond+"updated_at > ? AND flag = ? and availabilty > 0",Time.parse(params[:passenger_update])+2 ,1).limit(20).order("updated_at desc")
     drivers_new_updates = Trip.where(cond+"updated_at > ? AND flag = ? and availabilty > 0",Time.parse(params[:driver_update])+2,0).limit(20).order("updated_at desc")

     #render :text => passenger_new_updates.at(0).updated_at
     respond_to do |format|
       format.js do
         render "fetch_new", :locals => {:new_passengers => passenger_new_updates, :new_drivers => drivers_new_updates}
       end
       end
  end



  #from is the center of the circle of radius r
  #to is the db column (either to or form depending what we are calculating radius for)
  def dist(center_lat, center_long,radius_lat,radius_long)
    %| 3959 * 2 * ASIN(SQRT(POWER(SIN((#{center_lat}- #{radius_lat}) * pi()/180 / 2), 2) +COS(#{center_lat} * pi()/180) *COS(#{radius_lat}* pi()/180) *POWER(SIN((#{center_long} -#{radius_long}) * pi()/180 / 2), 2) ))|
  end

  def radius_from(center_lat, center_long)
    dist(center_lat,center_long,'from_latitude','from_longitude') +" AS distancefrom"
  end

  def radius_to(center_lat, center_long)
    dist(center_lat,center_long,'to_latitude','to_longitude')+ " AS distanceto"
  end


  def get_drivers
    cond=get_homebase_cond();
    drivers_new_updates = Trip.where(cond+"updated_at < ? AND flag = ? and availabilty > 0",Time.parse(params[:date])+2,0).order("updated_at desc").first(10)

    #render :text => passenger_new_updates.at(0).updated_at
    respond_to do |format|
      format.js do
        render "get_drivers", :locals => { :new_drivers => drivers_new_updates}
      end
    end
  end


  def get_passengers
    cond=get_homebase_cond();
    passenger_new_updates = Trip.where(cond+"updated_at < ? AND flag = ? and availabilty > 0",Time.parse(params[:date])+2 ,1).order("updated_at desc").first(10)

    #render :text => passenger_new_updates.at(0).updated_at
    respond_to do |format|
      format.js do
        render "get_passengers", :locals => {:new_passengers => passenger_new_updates}
      end
    end
  end

end
