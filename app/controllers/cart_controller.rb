require 'cart_manager'
class CartController < ApplicationController
  include CartManager
  helper_method :cart
  
  # GET /cart/show.html
  # GET /cart/show.json    
  def show
    @items    = cart.items
    @products = @items.collect(&:product)
    
    respond_to do |format|
      format.html { render layout: false  } 
      format.json { render json:   @items }
    end
  end
end
