class CheckoutController < ApplicationController

  def index


    session[:shipping_book_id]=params[:shipping_book_id]

    # get user id in this case email from session
    email_id = ''

    email_id=current_user.email

    customer = Customer.find_by_email(email_id)

    @customer=Customer.where(email: email_id)

    #shipping_book_id= params[:shipping_book_id]
    shipping_book_id= session[:shipping_book_id]

    #session[:shipping_book_id] = shipping_book_id


    @ship_address = ShippingBook.where(shipping_book_id: shipping_book_id)

    #get shopping cart of the user from session

    cart_id =session[:cart_id]



    #get cart_items associated with the shopping cart

    @check_cart_items=CartItem.where(shopping_cart_id: cart_id)


    #get count of unique items(does not consider each quantity ) in shopping cart
    @cart_item_count= CartItem.distinct.count('product_id')


    #@seller=Seller.where(seller_id: CartItem.seller_id)

    sub_total=0.00
    tax_rate=0.00
    ship_state=''
    item_sub_total=0.00
    ship_total=4.49

    #get sub total of the items in shopping cart
    @check_cart_items.each do |item|
      @product=Product.where(product_id: item.product_id)
      @product.each do |product|
        item_weight= product.technical_description.to_s.split(';')[1]
      end
      item_total=item.total_price
      #item_weight= item.product.technical_description.to_s.split(';')[1]
      item_weight= item_weight.to_s.split(' ')[0].to_f
      ship_total=ship_total+(item_weight*0.50*item.quantity)
      item_sub_total=@check_cart_items.to_a.sum { |item| item.total_price }
    end
    @total_ship_cost=ship_total.round(2)
    @item_sub_total=item_sub_total

    #calculate tax
    @ship_address.each do |ship|
      ship_state=ship.shipping_state_province
    end

    @state_tax=StateTax.where(state_code: ship_state)

    @state_tax.each do |state|
      tax_rate=state.tax_rate
    end
    tax_amount=tax_rate*item_sub_total
    @total_tax=tax_amount



    #calculate discount
    #get user_promo_code from form or view
    #user_promo_code= 'SPND100GET5'
    user_promo_code= params['promo']
    #user_promo_code= session[:promo]

    discount_amount=0.00
    if(params['promo'] !=nil)

      @system_promo_codes=Discount.where(discount_code: user_promo_code)
      @system_promo_codes.each do |discount|
        discount_amount=discount.discount_amount
        session[:discount]=discount_amount

      end
    else
      session[:discount]=discount_amount
    end


    @discount_amount= session[:discount]


    sub_total = (item_sub_total - @discount_amount)
    @cart_sub_total=sub_total+ship_total

    @total_due = tax_amount+sub_total+ship_total

    @cart_item_count= CartItem.distinct.count('product_id')

    #Shipping rate calculations

    #for standard $4.49 + $0.50/lb

    #for expedite $6.49+0.99/lb

    @discount_ship_cost=@total_ship_cost-@discount_amount

    last_index =0
    values = {
        :business => 'your sandbox email',
        :cmd => '_cart',
        :upload => 1,
        :return => checkout_index_url(transaction: 'successful'),
        :invoice =>current_cart.invoice_id
    }



    @check_cart_items.each_with_index do |item,index|
      product_name=''
      product_id=''

      @product=Product.where(product_id: item.product_id)
      @product.each do |product|
        product_name=product.name
        product_id=product.product_id
      end

      last_index=last_index+index
      values.merge!({

                        "amount_#{index+1}" => item.price.round(2),
                        "item_name_#{index+1}" => product_name,
                        "item_number_#{index+1}" =>  product_id,
                        "quantity_#{index+1}" => item.quantity

                    })
    end

    @last_index=last_index
    last_index=last_index+1
    values.merge!({
                      "amount_#{last_index}" => @total_tax.round(2),
                      "item_name_#{last_index}" => 'TAX',
                      "item_number_#{last_index}" => 'TAX01',
                      "quantity_#{last_index}" => 1
                  })

    last_index=last_index+1
    values.merge!({
                      "amount_#{last_index}" => @discount_ship_cost.round(2),
                      "item_name_#{last_index}" => 'SHP&HDLG',
                      "item_number_#{last_index}" => 'SHP&HDLG01',

                      "quantity_#{last_index}" => 1
                  })

    @url="https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query



    if(params[:transaction]=='successful')

      #flash[:notice]='Thank you for your business'
      response='success'

      if(response=='success')

        customer_id=''

        @customer.each do |customer|
          customer_id=customer.customer_id
        end

        #@shipping_type=10.00

        #add order
        order=Order.new
        #order.order_id=to be handel by protokoll gem
        order.customer_id=customer_id
        #order.shipping_id= to be updated later
        #order.order_status= to be  updated by seller
        order.order_date=Time.new.inspect
        order.shopping_cart_id=cart_id
        order.save


        @current_order_id=''
        @current_order=Order.where(shopping_cart_id: cart_id)

        @current_order.each do |order|
          @current_order_id=order.order_id
        end


        #add order items to the order
        @check_cart_items.each do |items|
          order_details=OrderDetail.new
          #order_details.order_detail_id=to be handel by protokoll gem
          order_details.order_id=@current_order_id
          order_details.product_id=items.product_id
          order_details.quantity=items.quantity
          order_details.unit_price=items.price
          order_details.discount= @discount_amount
          order_details.tax_status= "Taxed"
          #order_details.order_detail_status=to be checked with inventory and updated by seller
          order_details.save

          @product=Product.where(product_id: items.product_id)

          @product.each do |product|
            @quantity_balance=product.quantity-items.quantity
            @prod_id=product.id
          end

          Product.find_by_id(@prod_id).update_attribute(:quantity, @quantity_balance)

        end

        #add sipment info
        #order_shipment.shipment_id=to be handel by protokoll gem
        shipment=OrderShipment.new
        shipment.order_id=@current_order_id
        shipment.customer_id=customer_id
        shipment.shipping_type='Domestic Standard'
        #shipment.shipper_name=to be updated by seller after item is shipped
        @ship_address.each do |ship|
          shipment.shipping_name=ship.shipping_name
          shipment.shipping_address=ship.shipping_address
          shipment.shipping_city=ship.shipping_city
          shipment.shipping_state_province=ship.shipping_state_province
          shipment.shipping_zip_postal=ship.shipping_zip_postal
          shipment.shipping_country_region=ship.shipping_country_region
        end
        shipment.shipping_cost=@total_ship_cost
        #shipment.shipped_date=to be updated by seller after item is shipped
        shipment.save


        current_shipping_id=''
        @current_shipping=OrderShipment.where(order_id: @current_order_id)

        @current_shipping.each do |shipment|
          current_shipping_id=shipment.shipment_id
        end


        Order.find_by_order_id(@current_order_id).update_attribute(:shipping_id, current_shipping_id)

        #OrderNotifier.deliver_received(order)
        #OrderNotifier.received(order).deliver_now

        cart=current_cart
        cart.destroy
        session[:cart_id] = nil
        session[:shipping_book_id]=nil
        session[:discount]=nil

        redirect_to :controller => 'catalog',:category => "All", :action => 'index', :transaction => 'successful'

      end
    end
  end
end


def confirmation
end

def place_order
end