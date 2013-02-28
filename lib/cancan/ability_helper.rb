module Hurricane
  module CanCan
    module AbilityHelper
      def roles(user)
        user ||= User.new # for guest
        @roles = user.roles.map { |role| role.key.to_sym}
      end

      def has_roles?(*keys)
        if keys
          keys.inject(true) {|sum,key| sum &= @roles.include?(key)}
        else
          false
        end
      end
    end
  end
end
