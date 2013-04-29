class CartItem
  attr_accessor :product_id, :quantity

  def initialize(product_id)
    @product_id = product_id
    @quantity = 1
  end

  def product
    @product ||= Product.find(product_id)
  end

  def to_sale_item(sale)
    sale.sale_items.new product_id: product_id, quantity: quantity, product_price: product.price
  end
end
