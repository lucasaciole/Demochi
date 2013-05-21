require 'product_filter_paginator'
require 'cart_manager'

class WelcomeController < ApplicationController  
  include ProductFilterPaginator
  
  include CartManager
  helper_method :cart
  
  #GET /
  def index   
    # Get headlines
    @home_headlines = Article.find_by_home_headline true
  end
end
