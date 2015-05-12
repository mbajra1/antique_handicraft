class PurchaseHistoryController < ApplicationController
  def index

    customer_id=''
    if current_user
      email=current_user.email
      @customer=Customer.where(email: email)
      @customer.each do |customer|
        customer_id=customer.customer_id
      end
    end

    @purchase_history=Order.where(customer_id: customer_id)



  end
end
