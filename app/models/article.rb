class Article < ActiveRecord::Base
  attr_accessible :body, :title, :home_headline, :image

  # Uploaders.
  mount_uploader :image, ImageUploader

  # Validation
  validates :image, presence: true
end
