require "test_helper"

class Admin::CoordinatesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_coordinates_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_coordinates_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_coordinates_edit_url
    assert_response :success
  end
end