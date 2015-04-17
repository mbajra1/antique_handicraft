class ProductDetailsController < ApplicationController

  def index

    #TODO get customer_id from session or login information
    cust_id=' '

    @current_user=User.find(session[:user_id])

     @current_user.each do |user|
       @cust_id=Customer.where(email: user.email)
       @cust_id.each do |customer|
         cust_id=customer.customer_id
       end
     end

    prod_id=params[:product_id]

    @product_details =Product.where("product_id= '#{prod_id}'")


    for product in @product_details
      prod_subcat=product.subcategory
      prod_name=product.name
      prod_price=product.price
      prod_image=product.image_url
    end

    view_history=History.new
    view_history.customer_id=cust_id
    view_history.product_id=prod_id
    view_history.product_name=prod_name
    view_history.price=prod_price
    view_history.image_url=prod_image
    view_history.date_visited=Time.now
    view_history.save
    History.rm_duplicate

    @suggested_items = Product.where("subcategory= '#{prod_subcat}' AND product_id != '#{prod_id}' ")

    @viewing_history=History.where("customer_id= '#{cust_id}'")



  end

end
