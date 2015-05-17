class HomeController < ApplicationController
  def index


=begin
    cart_id=session[:cart_id]
    if(cart_id!=nil)
      user_cart=ShoppingCart.where(u_id: current_user.id)
      if(user_cart.id==cart_id)
        session[:cart_id]=user_cart.id
      end
    else
      session[:cart_id]=nil
    end
=end

    @bid_cart=BidCart.all

    @bid_cart.each do |bid_cart|
      @bid_product_id=bid_cart.bid_product_id
      @bid_cart_id=bid_cart.id
    end

    #@auction_item = BidCart.all

    @bid_product=Product.where("product_id=?", @bid_product_id)

    @bid_product.each do |product|
      @product_image_url=product.image.url(:thumb)
      @product_name=product.name
    end

    @featured_products=History.select("product_id").group("product_id").order("product_id ASC").count("product_id")
    key,value=@featured_products.first

    @featured_products=key
    #@featured_products = History.date_visited(10.days.ago)
    #@featured_product=@featured_products.select(:product_id).distinct
    @recent_products = Product.created_after(15.days.ago)
  end
end
