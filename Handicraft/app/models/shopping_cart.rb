class ShoppingCart < ActiveRecord::Base

  protokoll :invoice_id, :pattern => "INV%y###"
  has_many :cart_items, dependent: :destroy

  def add_product(product_id)
    current_item = cart_items.find_by_product_id(product_id)
    product = Product.find(product_id)

    if current_item

      if current_item.quantity < product.quantity
        current_item.quantity += 1
      else

      end

    else
      current_item = cart_items.build(product_id: product_id,seller_id: product.seller_id,price: product.price,quantity: 1)
    end
    current_item
  end

  def total_price
    cart_items.to_a.sum { |item| item.total_price }
  end

end
