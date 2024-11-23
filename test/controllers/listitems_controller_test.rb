require "test_helper"

class ListitemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get listitems_new_url
    assert_response :success
  end

  test "should get create" do
    get listitems_create_url
    assert_response :success
  end

  test "should get destroy" do
    get listitems_destroy_url
    assert_response :success
  end
end
