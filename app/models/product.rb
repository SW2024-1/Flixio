class Product < ApplicationRecord
  has_one_attached :file
  has_one_attached :thumbnail
  def self.looks(search, word)
      if search == "perfect_match"
        Product.where("name LIKE?","#{word}")
      elsif search == "forward_match"
        Product.where("name LIKE?","#{word}%")
      elsif search == "backward_match"
        Product.where("name LIKE?","%#{word}")
      elsif search == "partial_match"
        Product.where("name LIKE?","%#{word}%")
      else
        Product.all
      end
  end
  
  #バリデーション
  validates :name, presence: true  #空ではない
  validates :name, length: {maximum: 50 } #50文字以下
end
