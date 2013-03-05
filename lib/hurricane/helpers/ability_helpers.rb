module Hurricane
  module Helpers
    class AbilityHelpers
      def roles(user)
        return unless user
        @roles = user.roles.all.map {|role| role.name.to_sym}
        @roles
      end

      def has_roles?(roles)
        roles.each{|role| return true if @roles.include?(role)}
      end
    end
  end
end
