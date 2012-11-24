require 'test_helper'

class TripsConnectsControllerTest < ActionController::TestCase
  setup do
    @trips_connect = trips_connects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trips_connects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trips_connect" do
    assert_difference('TripsConnect.count') do
      post :create, trips_connect: { other_id: @trips_connect.other_id, trip_id: @trips_connect.trip_id }
    end

    assert_redirected_to trips_connect_path(assigns(:trips_connect))
  end

  test "should show trips_connect" do
    get :show, id: @trips_connect
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trips_connect
    assert_response :success
  end

  test "should update trips_connect" do
    put :update, id: @trips_connect, trips_connect: { other_id: @trips_connect.other_id, trip_id: @trips_connect.trip_id }
    assert_redirected_to trips_connect_path(assigns(:trips_connect))
  end

  test "should destroy trips_connect" do
    assert_difference('TripsConnect.count', -1) do
      delete :destroy, id: @trips_connect
    end

    assert_redirected_to trips_connects_path
  end
end
