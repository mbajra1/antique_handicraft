class Seller < ActiveRecord::Base

  has_one :user, as: :profile
  protokoll :seller_id, :pattern => "SEL%y###"
end
