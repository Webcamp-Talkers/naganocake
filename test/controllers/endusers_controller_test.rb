require 'test_helper'

class EndusersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get endusers_show_url
    assert_response :success
  end

  test "should get edit" do
    get endusers_edit_url
    assert_response :success
  end

  test "should get leaving" do
    get endusers_leaving_url
    assert_response :success
  end

end
