require 'test_helper'

class HostuserHomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get hostuser_homes_top_url
    assert_response :success
  end

end
