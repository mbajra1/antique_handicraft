class Seller < ActiveRecord::Base

  has_one :user, as: :profile
  protokoll :seller_id, :pattern => "SEL%y###"


  validates :last_name, :first_name, :email, :cell_phone, :email, :address, :company, :business_phone,  presence: true
  validates :last_name, :first_name, :email, :cell_phone, :email, :address, :company, :business_phone, uniqueness: true

  validates_length_of :last_name, :first_name,:company,:minimum => 2
  validates_length_of :last_name, :first_name,:company,:maximum => 40
  validates_length_of :cell_phone,:business_phone, :minimum => 10
  validates_length_of :cell_phone,:business_phone, :maximum => 10

end
