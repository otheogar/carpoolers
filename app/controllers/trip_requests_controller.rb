class TripRequestsController < ApplicationController
  # GET /trip_requests
  # GET /trip_requests.json
  def index
    @trip_requests = TripRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trip_requests }
    end
  end

  # GET /trip_requests/1
  # GET /trip_requests/1.json
  def show
    @trip_request = TripRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trip_request }
    end
  end

  # GET /trip_requests/new
  # GET /trip_requests/new.json
  def new
    @trip_request = TripRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip_request }
    end
  end

  # GET /trip_requests/1/edit
  def edit
    @trip_request = TripRequest.find(params[:id])
  end

  # POST /trip_requests
  # POST /trip_requests.json
  def create
    @trip_request = TripRequest.new(params[:trip_request])

    respond_to do |format|
      if @trip_request.save
        format.html { redirect_to @trip_request, notice: 'Trip request was successfully created.' }
        format.json { render json: @trip_request, status: :created, location: @trip_request }
      else
        format.html { render action: "new" }
        format.json { render json: @trip_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trip_requests/1
  # PUT /trip_requests/1.json
  def update
    @trip_request = TripRequest.find(params[:id])

    respond_to do |format|
      if @trip_request.update_attributes(params[:trip_request])
        format.html { redirect_to @trip_request, notice: 'Trip request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trip_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trip_requests/1
  # DELETE /trip_requests/1.json
  def destroy
    @trip_request = TripRequest.find(params[:id])
    @trip_request.destroy

    respond_to do |format|
      format.html { redirect_to trip_requests_url }
      format.json { head :no_content }
    end
  end
end
