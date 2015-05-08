class ProductDetailsController < ApplicationController

  def index



      prod_id=params['product_id']

      @product_details =Product.where("product_id= '#{prod_id}'")

      for product in @product_details
        prod_subcat=product.subcategory
        prod_name=product.name
        prod_price=product.price
        prod_image=product.image_url
      end


      #TODO make sure if it is refresh do not add to histroy only click or post  can make add
      customer_id=''


      if current_user
        email=current_user.email
        @customer=Customer.where(email: email)
        @customer.each do |customer|
          customer_id=customer.customer_id
        end

        #view_history.customer_id=current_user.id
      end


        view_history=History.new
        view_history.customer_id=customer_id
      view_history.product_id=prod_id
      view_history.product_name=prod_name
      view_history.price=prod_price
      view_history.image_url=prod_image
      view_history.date_visited=Time.now
      view_history.save
      History.rm_duplicate




      @suggested_items = Product.where("subcategory= '#{prod_subcat}' AND product_id != '#{prod_id}' ")

      if current_user
        @viewing_history = History.where("customer_id=?", customer_id)
      end






  end

end
