class OrderShipment < ActiveRecord::Base

  protokoll :shipping_id, :pattern => "SHP%y###"
end
