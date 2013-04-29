module Admin::SalesHelper
	def username(id)
		User.find(id).name
	end

	def product_category(sale_item)
		product(sale_item).category.name
	end

	def product_description(sale_item)
		product(sale_item).description
	end

	def product_code(sale_item)
		product(sale_item).code
	end

	def product(sale_item)
		Product.find(sale_item.product_id)
	end

	def total_item_value (sale_item)
		sale_item.product_price * sale_item.quantity
	end
end