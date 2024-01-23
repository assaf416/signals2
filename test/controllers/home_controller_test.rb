require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get news" do
    get home_news_url
    assert_response :success
  end

  test "should get stocks" do
    get home_stocks_url
    assert_response :success
  end

  test "should get indexes" do
    get home_indexes_url
    assert_response :success
  end

  test "should get filters" do
    get home_filters_url
    assert_response :success
  end

  test "should get signals" do
    get home_signals_url
    assert_response :success
  end
end
