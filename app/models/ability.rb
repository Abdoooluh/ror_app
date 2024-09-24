class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role_id == Role.find_by(name: "Admin").id
      can :manage, :all
    elsif user.role_id == Role.find_by(name: "Vendor").id
      # Vendor permissions
      can :read, Product, user_id: user.id
      can [:edit, :update, :destroy], Product, user_id: user.id
      can :create, Product

      can :read, Order do |order|
        order.product.user_id == user.id
      end
      can :edit, Order do |order|
        order.product.user_id == user.id
      end
    elsif user.role_id == Role.find_by(name: "Customer").id
      # Customer permissions
      can :read, Product
      can :create, Order
      can :read, Order, user_id: user.id
    else
      # Guest user permissions
      can :read, Product
    end
  end
end
