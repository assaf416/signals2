require "application_system_test_case"

class CandlesTest < ApplicationSystemTestCase
  setup do
    @candle = candles(:one)
  end

  test "visiting the index" do
    visit candles_url
    assert_selector "h1", text: "Candles"
  end

  test "should create candle" do
    visit candles_url
    click_on "New candle"

    fill_in "Candle time", with: @candle.candle_time
    fill_in "Close", with: @candle.close
    fill_in "High", with: @candle.high
    fill_in "Low", with: @candle.low
    fill_in "Open", with: @candle.open
    fill_in "Size", with: @candle.size
    fill_in "Ticker", with: @candle.ticker
    fill_in "Volume", with: @candle.volume
    click_on "Create Candle"

    assert_text "Candle was successfully created"
    click_on "Back"
  end

  test "should update Candle" do
    visit candle_url(@candle)
    click_on "Edit this candle", match: :first

    fill_in "Candle time", with: @candle.candle_time
    fill_in "Close", with: @candle.close
    fill_in "High", with: @candle.high
    fill_in "Low", with: @candle.low
    fill_in "Open", with: @candle.open
    fill_in "Size", with: @candle.size
    fill_in "Ticker", with: @candle.ticker
    fill_in "Volume", with: @candle.volume
    click_on "Update Candle"

    assert_text "Candle was successfully updated"
    click_on "Back"
  end

  test "should destroy Candle" do
    visit candle_url(@candle)
    click_on "Destroy this candle", match: :first

    assert_text "Candle was successfully destroyed"
  end
end
