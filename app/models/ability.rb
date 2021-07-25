class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= Employee.new
      if user.admin?
        can :manage, :all
      else
        can :read, :all
      end
  end
end
