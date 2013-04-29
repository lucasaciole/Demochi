class SaleItem < ActiveRecord::Base
  # Mass-storage settings.
  attr_accessible :quantity, :product_price, :product_id
  
  # Relationships
  belongs_to :product 
  belongs_to :sale
  
  # Validations
  validates :product_id, :sale_id, :quantity, :product_price, presence: true
  validates :quantity,      numericality: { only_integer: true, greater_then: 0 }
  validates :product_price, numericality: { only_float: true,   greater_than: 0 }
end
