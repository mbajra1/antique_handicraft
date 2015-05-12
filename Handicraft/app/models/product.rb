class Product < ActiveRecord::Base

  # Relationship
  belongs_to :user

  # Assign product id automatically
  protokoll :product_id, :pattern => "PRD%y###"
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :subcategory, presence: true
  validates :product_condition, presence: true
  validates :price, presence:true
  validates :quantity, presence:true

  # For image upload
  #has_attached_file :image, :styles => { :large => "600x600>", :medium => "200x200>", :thumb => "150x150>" }
  #validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

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
