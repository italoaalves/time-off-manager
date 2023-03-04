require "application_system_test_case"

class OffTimesTest < ApplicationSystemTestCase
  setup do
    @off_time = off_times(:one)
  end

  test "visiting the index" do
    visit off_times_url
    assert_selector "h1", text: "Off times"
  end

  test "should create off time" do
    visit off_times_url
    click_on "New off time"

    fill_in "Ends at", with: @off_time.ends_at
    fill_in "Starts at", with: @off_time.starts_at
    fill_in "Vacation", with: @off_time.vacation_id
    click_on "Create Off time"

    assert_text "Off time was successfully created"
    click_on "Back"
  end

  test "should update Off time" do
    visit off_time_url(@off_time)
    click_on "Edit this off time", match: :first

    fill_in "Ends at", with: @off_time.ends_at
    fill_in "Starts at", with: @off_time.starts_at
    fill_in "Vacation", with: @off_time.vacation_id
    click_on "Update Off time"

    assert_text "Off time was successfully updated"
    click_on "Back"
  end

  test "should destroy Off time" do
    visit off_time_url(@off_time)
    click_on "Destroy this off time", match: :first

    assert_text "Off time was successfully destroyed"
  end
end
