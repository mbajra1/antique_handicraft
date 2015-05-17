class ShippingBook < ActiveRecord::Base
  protokoll :shipping_book_id, :pattern => "SHB%y###"


  validates :shipping_name, :shipping_address, :shipping_city, :shipping_zip_postal, :shipping_country_region, presence: true


  validates_length_of :shipping_name,:shipping_address, :shipping_city, :minimum => 2
  validates_length_of :shipping_name,:shipping_address, :shipping_city, :maximum => 50




end
