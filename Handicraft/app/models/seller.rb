class Seller < ActiveRecord::Base
  protokoll :seller_id, :pattern => "SEL%y###"
end
