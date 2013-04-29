require 'cart_manager'

class FinishBuyController < ApplicationController
	before_filter :root_path_if_cart_empty
	
	include CartManager
	
	def index
		if user_signed_in?
			# redirect_to finish_buy_pay_path
			self.pay
		else
			#TODO show error
			redirect_to finish_buy_login_path
		end
		
		
	end
	
	def login
  	if user_signed_in?
  		redirect_to finish_buy_pay_path
  	end
  	
  	# flash[:login_paths] = { success: finish_buy_pay_path }
  	
  	# render same name view
	end
	
  def pay
  	payment = Moiper::Payment.new(
		  :description      => "Compra na Loja Virtual",
		  :price            => cart.total_value,
		  :id               => "lv_compra_#{(Sale.last.id.to_i + 1)}",
		  :return_url       => root_url,																# TODO
		  :notification_url => "http://example.org/moip/notification"  	# TODO
		)

		response = payment.checkout

		if response.success?
      @sale = cart.to_sale(current_user)
			cart.items.clear
		  redirect_to response.checkout_url
		else
		  render :text => response.errors.to_sentence
		end
  end
  
  private
  
  def root_path_if_cart_empty
  	if cart.items.empty?
  		redirect_to root_path
  	end
  end
end