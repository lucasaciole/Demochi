class Admin::ApplicationController < ApplicationController

  before_filter :authenticate_admin
  
  private

  def authenticate_admin
    if !current_user.try(:admin?)
      redirect_to root_path
    end
  end
end
