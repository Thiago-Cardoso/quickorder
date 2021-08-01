class Ability
  include CanCan::Ability
  def initialize(employee)
      if employee.admin?
        can :manage, :all
      elsif employee.clerk?
        can :read, :Order
        can :read, :Dashboard
      elsif employee.cooker?
        can :read, :kitchen_orders
        can :read, :Dashboard
      end
  end
end
