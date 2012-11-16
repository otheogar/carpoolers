class TripsConnectsController < ApplicationController
  # GET /trips_connects
  # GET /trips_connects.json
  def index
    @trips_connects = TripsConnect.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trips_connects }
    end
  end

  # GET /trips_connects/1
  # GET /trips_connects/1.json
  def show
    @trips_connect = TripsConnect.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trips_connect }
    end
  end

  # GET /trips_connects/new
  # GET /trips_connects/new.json
  def new
    @trips_connect = TripsConnect.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trips_connect }
    end
  end

  # GET /trips_connects/1/edit
  def edit
    @trips_connect = TripsConnect.find(params[:id])
  end

  # POST /trips_connects
  # POST /trips_connects.json
  def create
    @trips_connect = TripsConnect.new(params[:trips_connect])

    respond_to do |format|
      if @trips_connect.save
        format.html { redirect_to @trips_connect, notice: 'Trips connect was successfully created.' }
        format.json { render json: @trips_connect, status: :created, location: @trips_connect }
      else
        format.html { render action: "new" }
        format.json { render json: @trips_connect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trips_connects/1
  # PUT /trips_connects/1.json
  def update
    @trips_connect = TripsConnect.find(params[:id])

    respond_to do |format|
      if @trips_connect.update_attributes(params[:trips_connect])
        format.html { redirect_to @trips_connect, notice: 'Trips connect was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trips_connect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips_connects/1
  # DELETE /trips_connects/1.json
  def destroy
    @trips_connect = TripsConnect.find(params[:id])
    @trips_connect.destroy

    respond_to do |format|
      format.html { redirect_to trips_connects_url }
      format.json { head :no_content }
    end
  end
end
