module Admin::ProductsHelper
  def form_select_categories
    Category.all.map do |c|
      [c.name, c.id]
    end
  end

  def format_product_price
  	exp = Regexp.new Regexp.escape(t 'number.currency.format.unit')  +  "\s*"
    @product.price? ? number_to_currency(@product.price).gsub(exp, "") : ""
  end
end
