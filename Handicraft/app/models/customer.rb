class Customer < ActiveRecord::Base
  #Relationship
  has_one :user, as: :profile
  #Assign customer id automatically
  protokoll :customer_id, :pattern => 'CUS%y###'

  validates :last_name, :first_name, :email, :cell_phone, :email, :address, presence: true
  validates :cell_phone, uniqueness: true

  validates_length_of :last_name,:first_name, :minimum => 2
  validates_length_of :last_name, :first_name, :maximum => 20
  validates_length_of :cell_phone, :minimum => 10
  validates_length_of :cell_phone, :maximum => 10



end
