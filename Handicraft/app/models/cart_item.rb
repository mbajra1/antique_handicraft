class CartItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :shopping_cart

  def total_price
    self.price * quantity
  end
end
