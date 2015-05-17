class Product < ActiveRecord::Base
  has_many :cart_items
  has_many :order_details

  # Relationship
  belongs_to :user

  before_destroy :ensure_not_referenced_by_any_cart_item

  def ensure_not_referenced_by_any_cart_item
    if cart_items.empty?
      return true
    else
      errors.add(:base, 'Cart Items present')
      return false
    end
  end

  # Assign product id automatically
  protokoll :product_id, :pattern => "PRD%y###"
  validates :name,:description,:category,:subcategory,:product_condition,:price,:quantity, presence: true
  # validates :name, uniqueness: true
  validates_length_of :name, :minimum => 2
  validates_length_of :name, :maximum => 25
  validates_length_of :description, :maximum => 1000
  validates :price,:quantity, :numericality => { :greater_than_or_equal_to => 0 }


  # For image upload
  has_attached_file :image, :styles => { :large => "600x600>", :medium => "200x200>", :thumb => "150x150>", :small => "100x100"}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

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
