require 'test_helper'
# require (File.dirname(File.realdirpath(__FILE__)) + '/../test_helper.rb')

class Admin::ProductsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "shoud get index" do
  	get :index
  	assert_response :success
  end
  
  test "cant add blank product" do
  	@product = Product.new
  	assert !@product.save, "Blank product saved"
  end
end
