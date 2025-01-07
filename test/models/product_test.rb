require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test '正常ケース' do
    pro = Product.new
    pro.name = '正常'
    assert pro.valid?
  end
  
  test '異常ケース1' do
    pro = Product.new
    assert pro.invalid?
    pro.name = 'A' * 60
    assert_not pro.valid?
    assert pro.errors.include?(:name)
  end
  
  test '異常ケース2' do
    pro = Product.new
    assert pro.invalid?
    pro.name = 
    assert_not pro.valid?
    assert pro.errors.include?(:name)
  end
end
