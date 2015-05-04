class HomeController < ApplicationController
  def index

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

    @featured_products = History.date_visited(5.days.ago)
    @recent_products = Product.created_after(2.days.ago)
  end
end
