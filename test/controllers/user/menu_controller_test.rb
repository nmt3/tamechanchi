require "test_helper"

class User::MenuControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_menu_index_url
    assert_response :success
  end
end
