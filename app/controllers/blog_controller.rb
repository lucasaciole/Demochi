class BlogController < ApplicationController
  def index
    @recent = Article.order("created_at DESC").limit(3).all
  end

  def search
  end

  def show
  end
end
