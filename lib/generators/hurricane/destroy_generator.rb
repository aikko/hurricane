module Hurricane
  module Generators
    class DestroyGenerator < Rails::Generators::Base
      def remove_dependencies
        gsub_file 'Gemfile',/^# imported .* hurricane BEGIN.*imported .* hurricane END/m, ''
      end
      desc "remove assets"
      def remove_assets
        remove_file 'app/assets/javascripts/common-ui.js.coffee.erb'
      end

      def remove_templates
        remove_file 'lib/haml'
        remove_file 'lib/rails'
      end

    end
  end
end
