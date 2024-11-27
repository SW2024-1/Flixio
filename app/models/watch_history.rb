class WatchHistory < ApplicationRecord
  belongs_to :user
  belongs_to :product
  
  validates :watched_at, presence: true
end
