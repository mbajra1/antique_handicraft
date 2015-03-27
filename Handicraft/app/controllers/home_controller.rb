class HomeController < ApplicationController
  def index
    @recent_products = Product.where("id > 3")
    @featured_products = Product.where("id < 4")
  end
end
