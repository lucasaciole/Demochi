class Product < ActiveRecord::Base
  # Mass-storage settings.
  attr_accessible :category_id, :code, :description, :price, :image, :category

  # Associations.
  belongs_to :category
  has_many :items
  
  # Uploaders.
  mount_uploader :image, ImageUploader
  
  # Validations.
  validates :code,  uniqueness: true
  validates :code, :description, :price, :category_id, presence: true
  validates :code,  numericality: { only_integer: true, greater_than: 0 }
  validates :code,  length: { maximum: 15 }
  validates :price, numericality: { only_float:   true, greater_than: 0 }
  validates :image, 
    allow_blank: true, 
    format: {
      with: %r{\.(jpe?g)\z}i,
      message: 'must be a JPG'
    }
    
  # Scopes.
  scope :by_category_id, (lambda do |category_id| 
    where category_id: category_id
  end)
  
  scope :by_description, (lambda do |description|
    where "description LIKE ?", "%#{description}%"
  end)

  scope :by_code, (lambda do |code|
    where "code LIKE ?", "%#{code}%"
  end)
  
  def self.search(conditions = {})
  	my_scope = scoped
    my_scope = my_scope.by_category_id conditions[:category_id] if conditions[:category_id]
    my_scope = my_scope.by_description conditions[:search][:description] if conditions[:search] && conditions[:search][:description]
    my_scope = my_scope.by_code conditions[:search][:code] if conditions[:search] && conditions[:search][:code]
    my_scope
  end
end
