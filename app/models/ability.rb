class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin_role?
      can :manage, :all
    else
      can [:read, :update, :create], Task
      can :manage, User
      can [:read, :update, :create], Event
    end
  end
end
