require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    product = products(:one)
    get product_path(product)
    assert_response :success
  end
end
