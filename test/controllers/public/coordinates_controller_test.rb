require "test_helper"

class Public::CoordinatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_coordinates_index_url
    assert_response :success
  end

  test "should get show" do
    get public_coordinates_show_url
    assert_response :success
  end
end
