class Listitem < ApplicationRecord
  belongs_to :list
  belongs_to :product
  validates :product_id, presence: true
  validates :list_id, presence: true
end
