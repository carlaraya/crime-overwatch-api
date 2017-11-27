require 'test_helper'

class PoliceStationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @police_station = police_stations(:one)
  end

  test "should get index" do
    get police_stations_url, as: :json
    assert_response :success
  end

  test "should create police_station" do
    assert_difference('PoliceStation.count') do
      post police_stations_url, params: { police_station: { address: @police_station.address, contact_info: @police_station.contact_info, email: @police_station.email, lat: @police_station.lat, lng: @police_station.lng, name: @police_station.name, password_digest: @police_station.password_digest, username: @police_station.username } }, as: :json
    end

    assert_response 201
  end

  test "should show police_station" do
    get police_station_url(@police_station), as: :json
    assert_response :success
  end

  test "should update police_station" do
    patch police_station_url(@police_station), params: { police_station: { address: @police_station.address, contact_info: @police_station.contact_info, email: @police_station.email, lat: @police_station.lat, lng: @police_station.lng, name: @police_station.name, password_digest: @police_station.password_digest, username: @police_station.username } }, as: :json
    assert_response 200
  end

  test "should destroy police_station" do
    assert_difference('PoliceStation.count', -1) do
      delete police_station_url(@police_station), as: :json
    end

    assert_response 204
  end
end
