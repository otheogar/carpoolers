class TripsController < ApplicationController
  before_filter :authorize
  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
    @trips_passengers = Trip.where("flag = ?", 1)
    @trips_drivers = Trip.where("flag = ?", 0)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trips }
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @trip = Trip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/new
  # GET /trips/new.json
  def new
    @trip = Trip.new
    @trips_passengers = Trip.where("flag = ?", 1)
    @trips_drivers = Trip.where("flag = ?", 0)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/1/edit
  def edit
    @trip = Trip.find(params[:id])
  end

  # POST /trips
  # POST /trips.json
  def create
    owner = user_id
    @trip = Trip.new(from_string: params[:post_from],
        to_string: params[:post_to],date: Date.strptime(params[:post_date], '%m/%d/%Y'),
        from_latitude: params[:from_lat],from_longitude: params[:from_long],
        to_latitude: params[:to_lat], to_longitude: params[:to_long],
        flag: params[:rolepost]=='driver'?0:1,time: Chronic.parse(params[:post_time]), owner_id: owner)

    respond_to do |format|
      if @trip.save
        format.js do
          render "post", :locals => {:new_trip => @trip}
        end
      else
        format.html { render action: "new" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trips/1
  # PUT /trips/1.json
  def update
    @trip = Trip.find(params[:id])

    respond_to do |format|
      if @trip.update_attributes(params[:trip])
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :no_content }
    end
  end
end
