require "test_helper"

class Admin::UsersrailsControllerTest < ActionDispatch::IntegrationTest
  test "should get generate" do
    get admin_usersrails_generate_url
    assert_response :success
  end

  test "should get controller" do
    get admin_usersrails_controller_url
    assert_response :success
  end

  test "should get admin/products" do
    get admin_usersrails_admin/products_url
    assert_response :success
  end
end
