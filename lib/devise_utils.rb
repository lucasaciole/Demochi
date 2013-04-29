module DeviseUtils
  module ContentHelper
    def resource_name
      :user
    end

    def resource
      @resource ||= User.new
    end

    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end
  end
  
  module BackSignIn
  	def self.included(base)
  	  base.class_eval do
  	  	before_filter :set_back_if_finish_buy_login
  	  end
  	end
  
  	def set_back_if_finish_buy_login
  		# If login action comes from finish_buy/login
  		# Devise should redirect for pay
  		if (params[:controller] =~ /finish_buy/) && (params[:action] =~ /login/)
  			session[:devise_after_login_path] = finish_buy_pay_path
  		else
  		  # cancel redirect if user go to any action out of devise
  			unless params[:controller] =~ /devise/
  		  	session[:devise_after_login_path] = nil
  		  end
  		end
  	end
  
		def after_sign_in_path_for(resource)
			session[:devise_after_login_path] || stored_location_for(resource) || root_path
		end
  end
end