require "test_helper"

class Home::ManagersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_managers_index_url
    assert_response :success
  end
end
