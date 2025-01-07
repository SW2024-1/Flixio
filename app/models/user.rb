class User < ApplicationRecord
  has_secure_password
  has_one :list
    
  #バリデーション
  validates :uid, presence: true  #空ではない
  validates :password, presence: true  #空ではない
  validates :uid, length: {maximum: 20 } #20文字以下
  validates :password, length: {maximum: 20 } #20文字以下
end
