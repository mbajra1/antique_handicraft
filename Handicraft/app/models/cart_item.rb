class CartItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :shopping_cart

  def total_price
    product.price * quantity
  end


end
