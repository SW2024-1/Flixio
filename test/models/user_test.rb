require "test_helper"

class UserTest < ActiveSupport::TestCase
  test '正常ケース' do
    u = User.new
    u.uid = '正常'
    u.password = 'seijou'
    assert u.valid?
  end
  
  test '異常ケース1' do
    u = User.new
    assert u.invalid?
    u.uid = 'A' * 30
    assert_not u.valid?
    assert u.errors.include?(:uid)
  end
  
  test '異常ケース2' do
    u = User.new
    assert u.invalid?
    u.uid = ''
    assert_not u.valid?
    assert u.errors.include?(:uid)
  end
  
  test '異常ケース3' do
    u = User.new
    assert u.invalid?
    u.password = 'A' * 30
    assert_not u.valid?
    assert u.errors.include?(:password)
  end
  
  test '異常ケース4' do
    u = User.new
    assert u.invalid?
    u.password = ''
    assert_not u.valid?
    assert u.errors.include?(:password)
  end
end
