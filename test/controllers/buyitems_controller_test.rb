require "test_helper"

class BuyitemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get buyitems_new_url
    assert_response :success
  end

  test "should get create" do
    get buyitems_create_url
    assert_response :success
  end

  test "should get destroy" do
    get buyitems_destroy_url
    assert_response :success
  end
end
