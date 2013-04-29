class Admin::SalesController < Admin::ApplicationController
  def index
    @sales = Sale.scoped
    @sales = @sales.filter_date params[:search]
    class << @sales
    	attr_accessor :period_total_price
    end
    @sales.period_total_price = @sales.sum(:total_price)
    @sales = @sales.page(params[:page]).per(15)
  end

  def show
  	@sale = Sale.find(params[:id])
  	@sale_items = @sale.sale_items

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end
end