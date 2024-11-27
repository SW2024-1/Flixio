class Product < ApplicationRecord
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
end
