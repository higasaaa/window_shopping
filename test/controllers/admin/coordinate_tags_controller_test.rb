require "test_helper"

class Admin::CoordinateTagsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_coordinate_tags_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_coordinate_tags_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_coordinate_tags_edit_url
    assert_response :success
  end
end
