module Hurricane
  module CanCan
    module AbilityHelpers
      def roles(user)
        return unless user
        @roles ||= user.roles.map { |role| role.key.to_sym}
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
