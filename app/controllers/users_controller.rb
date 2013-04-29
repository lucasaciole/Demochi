class UsersController < ApplicationController
  before_filter :authenticate_user!

  def sales
    @sales = current_user.sales

    respond_to do |format|
      format.html 
      format.json { render json: @sales }
    end
  end
end