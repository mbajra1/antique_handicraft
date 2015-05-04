class Order < ActiveRecord::Base
  has_many :order_details, dependent: :destroy
  protokoll :order_id, :pattern => "ODR%y###"
end
