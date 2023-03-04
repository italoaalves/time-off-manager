require "test_helper"

class OffTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @off_time = off_times(:one)
  end

  test "should get index" do
    get off_times_url
    assert_response :success
  end

  test "should get new" do
    get new_off_time_url
    assert_response :success
  end

  test "should create off_time" do
    assert_difference("OffTime.count") do
      post off_times_url, params: { off_time: { ends_at: @off_time.ends_at, starts_at: @off_time.starts_at, vacation_id: @off_time.vacation_id } }
    end

    assert_redirected_to off_time_url(OffTime.last)
  end

  test "should show off_time" do
    get off_time_url(@off_time)
    assert_response :success
  end

  test "should get edit" do
    get edit_off_time_url(@off_time)
    assert_response :success
  end

  test "should update off_time" do
    patch off_time_url(@off_time), params: { off_time: { ends_at: @off_time.ends_at, starts_at: @off_time.starts_at, vacation_id: @off_time.vacation_id } }
    assert_redirected_to off_time_url(@off_time)
  end

  test "should destroy off_time" do
    assert_difference("OffTime.count", -1) do
      delete off_time_url(@off_time)
    end

    assert_redirected_to off_times_url
  end
end
