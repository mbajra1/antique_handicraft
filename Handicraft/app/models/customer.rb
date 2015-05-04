class Customer < ActiveRecord::Base
  #Relationship
  has_one :user, as: :profile
  #Assign customer id automatically
  protokoll :customer_id, :pattern => 'CUS%y###'
end
