require "application_system_test_case"

class TickersTest < ApplicationSystemTestCase
  setup do
    @ticker = tickers(:one)
  end

  test "visiting the index" do
    visit tickers_url
    assert_selector "h1", text: "Tickers"
  end

  test "should create ticker" do
    visit tickers_url
    click_on "New ticker"

    fill_in "Ask price", with: @ticker.ask_price
    fill_in "Ask size", with: @ticker.ask_size
    fill_in "Bid price", with: @ticker.bid_price
    fill_in "Bid size", with: @ticker.bid_size
    fill_in "Industry", with: @ticker.industry
    fill_in "Kind", with: @ticker.kind
    fill_in "Last change percent", with: @ticker.last_change_percent
    fill_in "Last price", with: @ticker.last_price
    fill_in "Last price at", with: @ticker.last_price_at
    fill_in "Market", with: @ticker.market
    fill_in "Name", with: @ticker.name
    fill_in "Sector", with: @ticker.sector
    fill_in "Symbol", with: @ticker.symbol
    click_on "Create Ticker"

    assert_text "Ticker was successfully created"
    click_on "Back"
  end

  test "should update Ticker" do
    visit ticker_url(@ticker)
    click_on "Edit this ticker", match: :first

    fill_in "Ask price", with: @ticker.ask_price
    fill_in "Ask size", with: @ticker.ask_size
    fill_in "Bid price", with: @ticker.bid_price
    fill_in "Bid size", with: @ticker.bid_size
    fill_in "Industry", with: @ticker.industry
    fill_in "Kind", with: @ticker.kind
    fill_in "Last change percent", with: @ticker.last_change_percent
    fill_in "Last price", with: @ticker.last_price
    fill_in "Last price at", with: @ticker.last_price_at
    fill_in "Market", with: @ticker.market
    fill_in "Name", with: @ticker.name
    fill_in "Sector", with: @ticker.sector
    fill_in "Symbol", with: @ticker.symbol
    click_on "Update Ticker"

    assert_text "Ticker was successfully updated"
    click_on "Back"
  end

  test "should destroy Ticker" do
    visit ticker_url(@ticker)
    click_on "Destroy this ticker", match: :first

    assert_text "Ticker was successfully destroyed"
  end
end
