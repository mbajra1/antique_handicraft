class ShippingBook < ActiveRecord::Base
  protokoll :shipping_book_id, :pattern => "SHB%y###"
end
