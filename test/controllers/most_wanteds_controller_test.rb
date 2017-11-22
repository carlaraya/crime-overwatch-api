require 'test_helper'

class MostWantedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @most_wanted = most_wanteds(:one)
  end

  test "should get index" do
    get most_wanteds_url, as: :json
    assert_response :success
  end

  test "should create most_wanted" do
    assert_difference('MostWanted.count') do
      post most_wanteds_url, params: { most_wanted: { additional_info: @most_wanted.additional_info, crime_type_id: @most_wanted.crime_type_id, exact_crime: @most_wanted.exact_crime, name: @most_wanted.name, reward: @most_wanted.reward } }, as: :json
    end

    assert_response 201
  end

  test "should show most_wanted" do
    get most_wanted_url(@most_wanted), as: :json
    assert_response :success
  end

  test "should update most_wanted" do
    patch most_wanted_url(@most_wanted), params: { most_wanted: { additional_info: @most_wanted.additional_info, crime_type_id: @most_wanted.crime_type_id, exact_crime: @most_wanted.exact_crime, name: @most_wanted.name, reward: @most_wanted.reward } }, as: :json
    assert_response 200
  end

  test "should destroy most_wanted" do
    assert_difference('MostWanted.count', -1) do
      delete most_wanted_url(@most_wanted), as: :json
    end

    assert_response 204
  end
end
