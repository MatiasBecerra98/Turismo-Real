require 'test_helper'

class CleaningEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cleaning_event = cleaning_events(:one)
  end

  test "should get index" do
    get cleaning_events_url
    assert_response :success
  end

  test "should get new" do
    get new_cleaning_event_url
    assert_response :success
  end

  test "should create cleaning_event" do
    assert_difference('CleaningEvent.count') do
      post cleaning_events_url, params: { cleaning_event: { appartment_id: @cleaning_event.appartment_id, janitor_id: @cleaning_event.janitor_id, reminder_sent: @cleaning_event.reminder_sent, time_of_event: @cleaning_event.time_of_event } }
    end

    assert_redirected_to cleaning_event_url(CleaningEvent.last)
  end

  test "should show cleaning_event" do
    get cleaning_event_url(@cleaning_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_cleaning_event_url(@cleaning_event)
    assert_response :success
  end

  test "should update cleaning_event" do
    patch cleaning_event_url(@cleaning_event), params: { cleaning_event: { appartment_id: @cleaning_event.appartment_id, janitor_id: @cleaning_event.janitor_id, reminder_sent: @cleaning_event.reminder_sent, time_of_event: @cleaning_event.time_of_event } }
    assert_redirected_to cleaning_event_url(@cleaning_event)
  end

  test "should destroy cleaning_event" do
    assert_difference('CleaningEvent.count', -1) do
      delete cleaning_event_url(@cleaning_event)
    end

    assert_redirected_to cleaning_events_url
  end
end
