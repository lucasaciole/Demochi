class Admin::WelcomeController < Admin::ApplicationController
  #GET /
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end
end
