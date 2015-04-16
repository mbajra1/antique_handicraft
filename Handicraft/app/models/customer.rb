class Customer < ActiveRecord::Base

  protokoll :customer_id, :pattern => 'CUS%y###'
end
