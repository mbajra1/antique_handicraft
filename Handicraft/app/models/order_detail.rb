class OrderDetail < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  protokoll :order_detail_id, :pattern => "ODD%y###"
end
