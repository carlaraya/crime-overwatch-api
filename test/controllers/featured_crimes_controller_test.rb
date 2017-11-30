require 'test_helper'

class FeaturedCrimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @featured_crime = featured_crimes(:one)
  end

  test "should get index" do
    get featured_crimes_url, as: :json
    assert_response :success
  end

  test "should create featured_crime" do
    assert_difference('FeaturedCrime.count') do
      post featured_crimes_url, params: { featured_crime: { content: @featured_crime.content, crime_type_id: @featured_crime.crime_type_id, police_station_id: @featured_crime.police_station_id, title: @featured_crime.title } }, as: :json
    end

    assert_response 201
  end

  test "should show featured_crime" do
    get featured_crime_url(@featured_crime), as: :json
    assert_response :success
  end

  test "should update featured_crime" do
    patch featured_crime_url(@featured_crime), params: { featured_crime: { content: @featured_crime.content, crime_type_id: @featured_crime.crime_type_id, police_station_id: @featured_crime.police_station_id, title: @featured_crime.title } }, as: :json
    assert_response 200
  end

  test "should destroy featured_crime" do
    assert_difference('FeaturedCrime.count', -1) do
      delete featured_crime_url(@featured_crime), as: :json
    end

    assert_response 204
  end
end
