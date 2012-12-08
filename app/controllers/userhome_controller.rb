class UserhomeController < ApplicationController

  #GETS TRIPS FROM THE MEMCACHE AND PUTS IT IN THE MEMORY ON PAGE LOAD
  before_filter :authorize   do
    @all_trips = Rails.cache.fetch("trips",expires_in: 2.days)    do
         Trip.all
  end
  end

  def get_homebase_cond
    lat=session[:homelat]
    lng= session[:homelong]
    cond=""
    if !lat.nil? && !lng.nil?
      cond="from_latitude < (#{lat}+0.1) and from_latitude>(#{lat}-0.1) and from_longitude < (#{lng}+0.5) and from_longitude>(#{lng}-0.5) and "
    end
    cond
  end

  def get_lists
    cond=get_homebase_cond();
    #@trips_passengers = Trip.where(cond+"flag = ? and availabilty > 0", 1).limit(20).order("updated_at desc")
    @trips_drivers = Trip.where(cond+"flag = ? and availabilty > 0", 0).limit(20).order("updated_at desc")

    @driver_last_update = @trips_drivers.at(0).updated_at
    #GETS TRIPS FROM THE MEMORY, IF THERE IS A PROBLEM WITH ALL_TRIPS, THEN YOU HAVE A PROBLEM IN MEMCACHED
    @trips_passengers = @all_trips.select{|item| item.availabilty >0}.first(20)
    @passenger_last_update = @trips_passengers.at(0).updated_at
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
    @count = @messages.where("read_msg =?",0).count

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
    dist = 15
    from_lat =  (params[:from_lat]).to_f
    from_long =  (params[:from_long]).to_f
    to_lat =  (params[:to_lat]).to_f
    to_long =  (params[:to_long]).to_f
    long1 = from_long-dist / (Math.cos(degrees(from_lat)).abs * 111.04)
    long2 = from_long+dist / (Math.cos(degrees(from_lat)).abs * 111.04)

    lat1 = from_lat-dist / (111.04)
    lat2 = from_lat+dist / (111.04)
    long3 = to_long-dist / (Math.cos(degrees(to_lat)).abs * 111.04)
    long4 = to_long+dist / (Math.cos(degrees(to_lat)).abs * 111.04)

    lat3 = to_lat-dist / (111.04)
    lat4 = to_lat+dist / (111.04)

    if (params[:role] == "passenger")
      flag=1
    end
    #condition="SELECT *,"+radius_cond_from+","+radius_cond_to+ " FROM trips HAVING distancefrom < #{r_from} AND distanceto < #{r_to} AND date='#{search_date_formatted}' AND flag=#{flag} ORDER BY time LIMIT 20"
    condition="SELECT *,"+radius_cond_from+","+radius_cond_to+ " FROM trips WHERE from_latitude BETWEEN #{lat1} AND #{lat2} AND from_longitude BETWEEN #{long1} AND #{long2}  AND to_latitude BETWEEN #{lat3} AND #{lat4} AND to_longitude BETWEEN #{long3} AND #{long4}  HAVING distancefrom < #{r_from} AND distanceto < #{r_to} AND date='#{search_date_formatted}' AND flag=#{flag} ORDER BY time LIMIT 20"
    #hack to work in SQLITE
   # condition="SELECT * FROM trips WHERE date='#{search_date_formatted}' AND from_string='Chicago,IL' AND flag=#{flag} ORDER BY time LIMIT 20"
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


  def reload_feed


   get_lists
   respond_to do |format|
      format.js do
        render "reload_feed", :locals => {:trip_passengers_list => @trips_passengers, :trip_drivers_list => @trips_drivers}
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


  def connect
    @trip = Trip.find(params[:trip_id])
    availabilty = @trip.availabilty
    if(availabilty > 0)
      availabilty=availabilty - 1;
      @trip.update_attribute(:availabilty, availabilty )
      TripsConnect.create(trip_id: params[:trip_id], other_id: user_id)

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

  def delete_trip
    @trip_to_delete = Trip.find(params[:trip_id])
    if(@trip_to_delete.availabilty == 1)
      @trip_to_delete.destroy
      respond_to do |format|
        format.json { render :json => "1" }
      end
    else
      respond_to do |format|
        format.json { render :json => "0" }
      end
    end

  end

  def rating
    @trip = Trip.find(params[:trip_id])
    owner_ids = @trip.owner_id
    @trip.update_attribute(:rating, params[:ratings])
    @owner_trip = UserProfile.find_by_user_uid(owner_ids)
    #current_rating = params[:ratings]
    prev_rating= @owner_trip.rating
    prev_no_rating = @owner_trip.no_rating
    if prev_rating == 0
      new_rating =  params[:ratings]
    else
      new_rating = ((prev_rating * prev_no_rating) + params[:ratings].to_f)/(prev_no_rating + 1)
    end
    new_no_rating = 1
    #@trip=Trip.new(rating: params[:rating])
    respond_to do |format|
      if @owner_trip.update_attributes(:rating => new_rating, :no_rating => new_no_rating)
        #format.html { redirect_to @owner_trip, notice: 'Trip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @owner_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  def disconnect_trip
    @trip_to_disconnect = TripsConnect.find_by_trip_id(params[:trip_id])
    @trip_to_disconnect.destroy
    @trip_to_del= Trip.find(params[:trip_id])
    @trip_to_del.availabilty = @trip_to_del.availabilty + 1
    respond_to do |format|
      #format.html { redirect_to(userhome_url) }
      format.json { head :no_content }
    end
  end


  def fetch_mytrips
    logger.info "FETCHING TRIPS"
    @my_trips_as_driver_delete = Trip.where("flag =? and owner_id = ? ",0,user_id).limit(20)
    @my_trips_as_passenger_delete = Trip.where("flag =? and owner_id = ? ",1,user_id).limit(20)
    trips_connected=TripsConnect.where(:other_id => user_id)
    @my_trips_as_driver_disconnect = [];
    @my_trips_as_passenger_disconnect =[];

    if !trips_connected.empty?
      logger.info "NOT Empty"
      ids=trips_connected.collect {|t| t.trip_id}
      @my_trips_as_driver_disconnect = Trip.where(:flag => 1,:id => ids).limit(20)
      @my_trips_as_passenger_disconnect = Trip.where(:flag => 0,:id => ids).limit(20)
    else
      logger.info "Empty"
    end

    respond_to do |format|
      format.js do
        render "fetch_mytrips", :locals => {:trip_passengers_delete => @my_trips_as_passenger_delete, :trip_drivers_delete => @my_trips_as_driver_delete, :trip_passengers_disconnect => @my_trips_as_passenger_disconnect,:trip_drivers_disconnect => @my_trips_as_driver_disconnect}
      end
    end

  end

    def degrees(angle)
      angle * Math::PI / 180
    end

end

