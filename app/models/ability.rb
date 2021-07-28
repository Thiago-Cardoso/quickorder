class Ability
  include CanCan::Ability
  def initialize(employee)
      if employee.admin?
        can :manage, :all
      elsif employee.atendente?
        can :read, :all
      elsif employee.cozinheiro?
        can :read, :all
      end
  end
end
