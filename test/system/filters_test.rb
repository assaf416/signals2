require "application_system_test_case"

class FiltersTest < ApplicationSystemTestCase
  setup do
    @filter = filters(:one)
  end

  test "visiting the index" do
    visit filters_url
    assert_selector "h1", text: "Filters"
  end

  test "should create filter" do
    visit filters_url
    click_on "New filter"

    fill_in "Email notification", with: @filter.email_notification
    fill_in "Fundamental conditions", with: @filter.fundamental_conditions
    fill_in "Indicator conditions", with: @filter.indicator_conditions
    fill_in "Name", with: @filter.name
    fill_in "Pattern conditions", with: @filter.pattern_conditions
    fill_in "Price conditions", with: @filter.price_conditions
    fill_in "User", with: @filter.user_id
    fill_in "Volume conditions", with: @filter.volume_conditions
    click_on "Create Filter"

    assert_text "Filter was successfully created"
    click_on "Back"
  end

  test "should update Filter" do
    visit filter_url(@filter)
    click_on "Edit this filter", match: :first

    fill_in "Email notification", with: @filter.email_notification
    fill_in "Fundamental conditions", with: @filter.fundamental_conditions
    fill_in "Indicator conditions", with: @filter.indicator_conditions
    fill_in "Name", with: @filter.name
    fill_in "Pattern conditions", with: @filter.pattern_conditions
    fill_in "Price conditions", with: @filter.price_conditions
    fill_in "User", with: @filter.user_id
    fill_in "Volume conditions", with: @filter.volume_conditions
    click_on "Update Filter"

    assert_text "Filter was successfully updated"
    click_on "Back"
  end

  test "should destroy Filter" do
    visit filter_url(@filter)
    click_on "Destroy this filter", match: :first

    assert_text "Filter was successfully destroyed"
  end
end
