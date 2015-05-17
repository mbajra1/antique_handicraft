class ProductDetailsController < ApplicationController

  def index

    prod_id=params[:product_id]

    @product_details =Product.where("product_id= '#{prod_id}'")

   for product in @product_details
      prod_subcat=product.subcategory
      prod_name=product.name
      prod_price=product.price
      prod_description=product.description
      prod_image=product.image.url(:medium)
    end



    if current_user
      email_id=current_user.email
      customer = Customer.find_by_email(email_id)
      customer_id=customer.customer_id
    else
      customer_id='CUS00000'
    end
    view_history=History.new
    view_history.customer_id=customer_id
    view_history.product_id=prod_id
    view_history.product_name=prod_name
    view_history.description=prod_description
    view_history.price=prod_price
    view_history.image_url=prod_image
    view_history.date_visited=Time.now
    view_history.save
    History.rm_duplicate


    @suggested_items = Product.where("subcategory= '#{prod_subcat}' AND product_id != '#{prod_id}' ").limit(1)

    if current_user
      @viewing_history = History.where("customer_id=?", customer.customer_id).limit(8)
    end






end
  end
