class Product < ApplicationRecord
  has_one_attached :file
  has_one_attached :thumbnail
  validates :search, presence: true, inclusion: { in: %w(name description category), message: "%{value} is not a valid search field" }
  validates :word, presence: true, length: { minimum: 3, message: "must be at least 3 characters long" }
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
  
  validates :name, presence: true
  validate :file_format
  validate :thumbnail_format

  private

  def file_format
    if file.attached? && !file.content_type.in?(%w(video/mp4))
      errors.add(:file, 'must be an MP4 video')
    end
  end

  def thumbnail_format
    if thumbnail.attached? && !thumbnail.content_type.in?(%w(image/png image/jpg image/jpeg))
      errors.add(:thumbnail, 'must be a PNG or JPG image')
    end
  end
end
