require 'test_helper'

class TripsControllerTest < ActionController::TestCase
  setup do
    @trip = trips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trip" do
    assert_difference('Trip.count') do
      post :create, trip: { date: @trip.date, flag: @trip.flag, from_latitude: @trip.from_latitude, from_longitude: @trip.from_longitude, from_string: @trip.from_string, time: @trip.time, to_latitude: @trip.to_latitude, to_longitude: @trip.to_longitude, to_string: @trip.to_string }
    end

    assert_redirected_to trip_path(assigns(:trip))
  end

  test "should show trip" do
    get :show, id: @trip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trip
    assert_response :success
  end

  test "should update trip" do
    put :update, id: @trip, trip: { date: @trip.date, flag: @trip.flag, from_latitude: @trip.from_latitude, from_longitude: @trip.from_longitude, from_string: @trip.from_string, time: @trip.time, to_latitude: @trip.to_latitude, to_longitude: @trip.to_longitude, to_string: @trip.to_string }
    assert_redirected_to trip_path(assigns(:trip))
  end

  test "should destroy trip" do
    assert_difference('Trip.count', -1) do
      delete :destroy, id: @trip
    end

    assert_redirected_to trips_path
  end
end
