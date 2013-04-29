class Cart
	attr :items
	
	def initialize(items = [])
		@items = items
	end
	
	def add_item(product_id)
		if product?(product_id) # The products is already in the cart.
			false
		else
			@items << CartItem.new(product_id)
			true
		end
	end
	
	def remove_item(product_id)		
		@items.delete_at(product_index(product_id)) if product?(product_id)
	end
	
	def change_quantity(product_id, new_quantity)
		@items[product_index(product_id)].quantity = new_quantity if product?(product_id)
	end
	
	def items_count
		@items.map(&:quantity).inject(:+) || 0
	end
	
	def product_quantity(product_id)
		@items[product_index(product_id)].quantity
	end
	
	def product_index(product_id)
		@items.index { |item| item.product_id == product_id }
	end

	def product_price(product)
		product.price * @items[product_index(product.id)].quantity
	end

	def total_value
		@items.inject(0) { |memo, item| memo += item.product.price * item.quantity }
	end

	def product?(product_id)
		!!product_index(product_id)
	end

	def to_sale(user)
		@sale = user.sales.new
		@sale.total_price = total_value
		@sale.save
		@items.each do |item| 
			item.to_sale_item(@sale).save
		end

		@sale
	end
end
