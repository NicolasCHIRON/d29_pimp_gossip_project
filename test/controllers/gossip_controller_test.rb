require "test_helper"

class GossipControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get gossip_view_url
    assert_response :success
  end
end
