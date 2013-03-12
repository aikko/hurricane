class Ability
  include CanCan::Ability
  include Hurricane::CanCan::AbilityHelpers

  def initialize(user)
    user ||= <%=human_name%>.new # for guest
    roles(user)
    can :manage, :all if has_roles? :super_admin
    can :manager, <%=human_name%> if has_roles? :user_admin
  end
end
