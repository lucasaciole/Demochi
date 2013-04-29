require 'product_filter_paginator'
require 'cart_manager'

class ProductsController < ApplicationController
  include ProductFilterPaginator
  
  include CartManager
  helper_method :cart
  
  # GET /products/category/1
  # GET /products/
  def index
    @categories = Category.all
    @selected_category = params[:category_id]
    
    # Initialize @products
    filter_products
    paginate_products 8
    
    # If someone try access from a category link directly,
    # we need load render the cart, and load it.
    load_cart_items if !request.xhr?
    
    respond_to do |format|
    	format.html { render "welcome/index" }
      if !@products.empty?  
        format.js { render partial: "index" }
      else
        format.js { render partial: "products_not_found" }
      end
    end
  end
  
  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end
  
  # POST /products/1/add_to_cart
  # POST /products/1/add_to_cart.js
  # POST /products/1/add_to_cart.json
  def add_to_cart
    @succefully_added = cart.add_item params[:id].to_i
    
    respond_to do |format|
      format.html { redirect_to :root }
      format.js
      format.json { render json: cart }
    end
  end
  
  # DELETE /products/1/add_to_cart
  # DELETE /products/1/add_to_cart.js
  # DELETE /products/1/add_to_cart.json
  def remove_from_cart
    cart.remove_item params[:id].to_i
    
    respond_to do |format|
      format.html { redirect_to :root }
      format.js
      format.json { render json: cart }
    end
  end  
  
  def change_quantity
    cart.change_quantity params[:id].to_i , params[:quantity].to_i
    
    respond_to do |format|
      format.js
      format.html { redirect_to :show }
    end
  end
end
