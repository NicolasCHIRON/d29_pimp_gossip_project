require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get view_user" do
    get user_view_user_url
    assert_response :success
  end
end
