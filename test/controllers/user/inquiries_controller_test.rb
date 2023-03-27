require "test_helper"

class User::InquiriesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_inquiries_show_url
    assert_response :success
  end
end
