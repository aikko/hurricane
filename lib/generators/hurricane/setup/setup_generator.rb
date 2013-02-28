module Hurricane
  module Generators
    class SetupGenerator < Rails::Generators::Base
      def config_gem_file
        gem("bootstrap-sass",:group => :asset, :version => "~> 2.2.2.0")
        gem('haml-rails')
        gem('kaminari')
        gem('cancan')
      end
    end
  end
end

