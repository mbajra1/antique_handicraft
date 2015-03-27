class Product < ActiveRecord::Base
  validates :product_id, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :subcategory, presence: true
  validates :product_condition, presence: true
  validates :price, presence:true
end
