require 'test_helper'

class ShippingAddressControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shipping_address_index_url
    assert_response :success
  end

  test "should get edit" do
    get shipping_address_edit_url
    assert_response :success
  end

end
