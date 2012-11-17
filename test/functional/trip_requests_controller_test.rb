require 'test_helper'

class TripRequestsControllerTest < ActionController::TestCase
  setup do
    @trip_request = trip_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trip_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trip_request" do
    assert_difference('TripRequest.count') do
      post :create, trip_request: { accepted_flag: @trip_request.accepted_flag, req_id: @trip_request.req_id, trip_id: @trip_request.trip_id }
    end

    assert_redirected_to trip_request_path(assigns(:trip_request))
  end

  test "should show trip_request" do
    get :show, id: @trip_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trip_request
    assert_response :success
  end

  test "should update trip_request" do
    put :update, id: @trip_request, trip_request: { accepted_flag: @trip_request.accepted_flag, req_id: @trip_request.req_id, trip_id: @trip_request.trip_id }
    assert_redirected_to trip_request_path(assigns(:trip_request))
  end

  test "should destroy trip_request" do
    assert_difference('TripRequest.count', -1) do
      delete :destroy, id: @trip_request
    end

    assert_redirected_to trip_requests_path
  end
end
