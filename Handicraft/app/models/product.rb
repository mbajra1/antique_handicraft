class Product < ActiveRecord::Base
  # relationship
  belongs_to :user
  # assign product id automatically
  protokoll :product_id, :pattern => "PRD%y###"
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :subcategory, presence: true
  validates :product_condition, presence: true
  validates :price, presence:true
  validates :quantity, presence:true

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
