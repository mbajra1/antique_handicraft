class Product < ActiveRecord::Base
  belongs_to :user
  validates :product_id, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :subcategory, presence: true
  validates :product_condition, presence: true
  validates :price, presence:true
  validates :quantity, presence:true

  def combined_value
    "#{self}[#{self}]"
  end

  # Search Function
  def self.search(search)
    if search
      self.where(("name like ? OR category like ?"), "%#{search}%","%#{search}%")
    else
      self.all
    end
  end

  #Recent Items
  scope :created_after, ->(time) { where("created_at > ?", time).limit(3) }

end
