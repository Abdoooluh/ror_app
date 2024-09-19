# frozen_string_literal: true


class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all # Admins can do everything
    elsif user.is_a?(Vendor)
      # Vendor permissions
      can :read, Product, vendor_id: user.id  # Can see their own products
      can [:edit, :update, :destroy], Product, vendor_id: user.id  # Can edit and delete their own products

      can :read, Order do |order|
        order.product.vendor_id == user.id # Can see orders only for their products
      end
      can :edit, Order do |order|
        order.product.vendor_id == user.id # Can edit orders only for their products
      end

    elsif user.is_a?(User)
      # Regular user permissions
      can :read, Product # Can see all products
      can :create, Order # Can create orders
      can :read, Order, user_id: user.id # Can view their own orders
    else
      # Guest/Other users
      can :read, Product # Can see all products
    end
  end
end





# class Ability
#   include CanCan::Ability

#   def initialize(user)
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    # 
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
#   end
# end


