
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, uniqueness: true


  #--------------------- ASSOCIATIONS -------------------------
  belongs_to :profile, polymorphic: true, dependent: :destroy
  has_and_belongs_to_many :roles
  has_many :products,  :dependent => :destroy
  accepts_nested_attributes_for :products, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  #validates_presence_of :username

  #--------------------- ROLE -----------------------------
  after_create :default_role


  def default_role
    self.roles << Role.find_by_name("customer")
    self.save
  end

  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end

  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end


end
