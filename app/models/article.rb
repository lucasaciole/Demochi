class Article < ActiveRecord::Base
  attr_accessible :body, :title, :home_headline, :image

  # Uploaders.
  mount_uploader :image, ImageUploader

  # Validations
  validates :image, 
    allow_blank: true, 
    format: {
      with: %r{\.(jpe?g)\z}i,
      message: 'must be a JPG'
    }

end
