require 'test_helper'

class CratItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get crat_items_index_url
    assert_response :success
  end

end
