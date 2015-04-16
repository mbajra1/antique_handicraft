class ShoppingCart < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy
end
