require 'devise_utils'
class ApplicationController < ActionController::Base
  protect_from_forgery
  include DeviseUtils::BackSignIn
end
