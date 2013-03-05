class Ability
  include CanCan::Ability
  include Hurricane::Helpers::AbilityHelpers

  def initialize(user)
    user ||= <%=human_name%>.new # for guest
    roles(users)
    can :manage, :all if has_roles? :super_admin
    can :manager, :all <%=human_name%> if has_roles? :user_admin
  end
end
