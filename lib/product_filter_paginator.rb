module ProductFilterPaginator
	def filter_products
		@products = (@products || Product).search(params)
	end

	def paginate_products(quantity)
		@products = (@products || Product).page(params[:page]).per(quantity)    
	end
end