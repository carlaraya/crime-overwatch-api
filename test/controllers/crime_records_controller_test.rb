require 'test_helper'

class CrimeRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crime_record = crime_records(:one)
  end

  test "should get index" do
    get crime_records_url, as: :json
    assert_response :success
  end

  test "should create crime_record" do
    assert_difference('CrimeRecord.count') do
      post crime_records_url, params: { crime_record: { crime_type_id: @crime_record.crime_type_id, is_hidden: @crime_record.is_hidden, new: @crime_record.new, police_station_id: @crime_record.police_station_id, solved: @crime_record.solved } }, as: :json
    end

    assert_response 201
  end

  test "should show crime_record" do
    get crime_record_url(@crime_record), as: :json
    assert_response :success
  end

  test "should update crime_record" do
    patch crime_record_url(@crime_record), params: { crime_record: { crime_type_id: @crime_record.crime_type_id, is_hidden: @crime_record.is_hidden, new: @crime_record.new, police_station_id: @crime_record.police_station_id, solved: @crime_record.solved } }, as: :json
    assert_response 200
  end

  test "should destroy crime_record" do
    assert_difference('CrimeRecord.count', -1) do
      delete crime_record_url(@crime_record), as: :json
    end

    assert_response 204
  end
end
