class HomeController < ApplicationController
  def index
    @featured_products = History.date_visited(5.days.ago)
    @recent_products = Product.created_after(2.days.ago)
  end
end
