class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    elsif user.is_a?(Vendor)

      can :read, Product, vendor_id: user.id
      can [ :edit, :update, :destroy ], Product, vendor_id: user.id

      can :create, Product

      can :read, Order do |order|
        order.product.vendor_id == user.id
      end
      can :edit, Order do |order|
        order.product.vendor_id == user.id
      end

      can :manage, Vendor, id: user.id

    elsif user.is_a?(User)

      can :read, Product
      can :create, Order
      can :read, Order, user_id: user.id

      can :manage, User, id: user.id

      cannot :manage, Vendor

    else

      can :read, Product

      cannot :manage, User
      cannot :manage, Vendor
    end
  end
end
