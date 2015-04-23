class HomeController < ApplicationController
  def index
    date_param=Time.now-86400
    #date_param=1.day.from_now
    special_date_param=1.day.from_now

    @bid_cart=BidCart.all

    @bid_cart.each do |bid_cart|
      @bid_product_id=bid_cart.bid_product_id
      @bid_cart_id=bid_cart.id
    end


    #@auction_item = BidCart.all

    @bid_product=Product.where(product_id: @bid_product_id)


    @bid_product.each do |product|
      @product_image_url=product.image_url
      @product_name=product.name
    end



    @specialItems=Product.where("created_at = '#{special_date_param}'")
    @trendingItems=History.where("date_visited>= '#{date_param}'")
    # @bestSellers=Order.select("product_id").group("product_id").count("product_id").order("quantity DESC").limit(10)
    @recent_products = Product.where("id > 3")
    @featured_products = Product.where("id < 4")
  end
end
