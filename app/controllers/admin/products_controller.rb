require 'product_filter_paginator'

class Admin::ProductsController < Admin::ApplicationController
  include ProductFilterPaginator

  # GET admin/products
  # GET admin/products.json
  def index
    @categories = Category.all
    @selected_category = params[:category_id]

    # Initialize @products according to user interaction
    filter_products
    paginate_products 15
    
    respond_to do |format|
    	format.html { render "index" }
      if !@products.empty?  
        format.js   { render partial: "index" }
      else
        format.js   { render partial: "products_not_found" }
      end
    end
  end

  # GET admin/products/1
  # GET admin/products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET admin/products/new
  # GET admin/products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET admin/products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST admin/products
  # POST admin/products.json
  def create
    params[:product][:price] = format_float params[:product][:price]
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_product_path(@product), notice: t(:'products.created') }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT admin/products/1
  # PUT admin/products/1.json

  def update
    params[:product][:price] = format_float params[:product][:price]
    @product = Product.find(params[:id])

    respond_to do |format|
      params[:product][:price] = format_float params[:product][:price]
      if @product.update_attributes(params[:product])
        format.html { redirect_to admin_product_path(@product), notice: t(:'products.edited')  }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE admin/products/1
  # DELETE admin/products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to admin_products_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def format_float(price)
    price.gsub ",", "."
  end
end
