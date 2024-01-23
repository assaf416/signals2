require "test_helper"

class CandlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @candle = candles(:one)
  end

  test "should get index" do
    get candles_url
    assert_response :success
  end

  test "should get new" do
    get new_candle_url
    assert_response :success
  end

  test "should create candle" do
    assert_difference("Candle.count") do
      post candles_url, params: { candle: { candle_time: @candle.candle_time, close: @candle.close, high: @candle.high, low: @candle.low, open: @candle.open, size: @candle.size, ticker: @candle.ticker, volume: @candle.volume } }
    end

    assert_redirected_to candle_url(Candle.last)
  end

  test "should show candle" do
    get candle_url(@candle)
    assert_response :success
  end

  test "should get edit" do
    get edit_candle_url(@candle)
    assert_response :success
  end

  test "should update candle" do
    patch candle_url(@candle), params: { candle: { candle_time: @candle.candle_time, close: @candle.close, high: @candle.high, low: @candle.low, open: @candle.open, size: @candle.size, ticker: @candle.ticker, volume: @candle.volume } }
    assert_redirected_to candle_url(@candle)
  end

  test "should destroy candle" do
    assert_difference("Candle.count", -1) do
      delete candle_url(@candle)
    end

    assert_redirected_to candles_url
  end
end
