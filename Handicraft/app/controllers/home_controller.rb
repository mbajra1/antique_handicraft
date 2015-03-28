class HomeController < ApplicationController
  def index
    date_param=Time.now-86400
    #date_param=1.day.from_now
    special_date_param=1.day.from_now
    @specialItems=Product.where("created_at = '#{special_date_param}'")
    @trendingItems=History.where("date_visited>= '#{date_param}'")
    # @bestSellers=Order.select("product_id").group("product_id").count("product_id").order("quantity DESC").limit(10)
    @recent_products = Product.where("id > 3")
    @featured_products = Product.where("id < 4")
  end
end
