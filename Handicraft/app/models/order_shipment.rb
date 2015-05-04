class OrderShipment < ActiveRecord::Base

  protokoll :shipment_id, :pattern => "SHP%y###"
end
