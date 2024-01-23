require "test_helper"

class FiltersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @filter = filters(:one)
  end

  test "should get index" do
    get filters_url
    assert_response :success
  end

  test "should get new" do
    get new_filter_url
    assert_response :success
  end

  test "should create filter" do
    assert_difference("Filter.count") do
      post filters_url, params: { filter: { email_notification: @filter.email_notification, fundamental_conditions: @filter.fundamental_conditions, indicator_conditions: @filter.indicator_conditions, name: @filter.name, pattern_conditions: @filter.pattern_conditions, price_conditions: @filter.price_conditions, user_id: @filter.user_id, volume_conditions: @filter.volume_conditions } }
    end

    assert_redirected_to filter_url(Filter.last)
  end

  test "should show filter" do
    get filter_url(@filter)
    assert_response :success
  end

  test "should get edit" do
    get edit_filter_url(@filter)
    assert_response :success
  end

  test "should update filter" do
    patch filter_url(@filter), params: { filter: { email_notification: @filter.email_notification, fundamental_conditions: @filter.fundamental_conditions, indicator_conditions: @filter.indicator_conditions, name: @filter.name, pattern_conditions: @filter.pattern_conditions, price_conditions: @filter.price_conditions, user_id: @filter.user_id, volume_conditions: @filter.volume_conditions } }
    assert_redirected_to filter_url(@filter)
  end

  test "should destroy filter" do
    assert_difference("Filter.count", -1) do
      delete filter_url(@filter)
    end

    assert_redirected_to filters_url
  end
end
