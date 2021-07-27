class Ability
  include CanCan::Ability
  def initialize(employee)
      if employee.admin?
        can :manage, :all
      elsif employee.clerk?
        can :read, :all
      elsif employee.cooker?
        can :read, :all
      end
  end
end
