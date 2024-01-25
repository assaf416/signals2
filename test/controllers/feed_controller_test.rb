require "test_helper"

class FeedControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get feed_index_url
    assert_response :success
  end

  test "should get chat" do
    get feed_chat_url
    assert_response :success
  end

  test "should get calendar" do
    get feed_calendar_url
    assert_response :success
  end

  test "should get meeting" do
    get feed_meeting_url
    assert_response :success
  end
end
