require "test_helper"

class MobileControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get mobile_home_url
    assert_response :success
  end

  test "should get tickers" do
    get mobile_tickers_url
    assert_response :success
  end

  test "should get ticker" do
    get mobile_ticker_url
    assert_response :success
  end
end
