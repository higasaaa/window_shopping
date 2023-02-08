require "test_helper"

class Admin::IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_index_create_url
    assert_response :success
  end
end
