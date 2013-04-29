require 'product_filter_paginator'
require 'cart_manager'

class WelcomeController < ApplicationController  
  include ProductFilterPaginator
  
  include CartManager
  helper_method :cart
  
  #GET /
  def index   
    # Load categories for filter products
    @categories = Category.all
     
    # filter_products
    paginate_products 8
    
    load_cart_items
    
    respond_to do |format|
      format.html { render(partial: "products/index") if request.xhr? }
      format.js   { render partial: "products/index"                  }
      format.json { render json:    @products                         }
    end
  end
end
