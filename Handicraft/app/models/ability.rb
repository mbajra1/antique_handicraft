class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
   # u.role = Role.new
    #u.role.name = "customer"
    #user ||= u # customer user

    if user.role? ("admin")
      can :manage, :all
    else
      can :read, :all
    end

    if user.role? ("seller")
      can :create, Product
      can :manage, Product do |product|
       product.u_id == user.id
      end
    end
  end
end

