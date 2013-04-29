module CartManager
	def load_cart_items
		@items          = cart.items
		@cart_products  = @items.collect { |item| Product.find(item.product_id) }
	end
	
	protected
	
	def cart
		return @cart if @cart
		session[:cart] ||= []
		@cart = Cart.new session[:cart]
	end    
end
