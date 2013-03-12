module Hurricane
  module Generators
    class InitGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates",__FILE__)
     
      def config_gem_file
        append_to_file 'Gemfile', "\n\n# imported by hurricane BEGIN" 
        gem "bootstrap-sass",:version => "~> 2.2.2.0", :group => :assets
        # TODO let user choose which template they want in future
        gem "haml-rails"
        gem "kaminari"
        gem "cancan", :version => "= 1.6.8"
        append_to_file "Gemfile", "\n# imported by hurricane END"
      end

      def install_gems
        inside Rails.root do
          run "bundle install"
        end
      end

      def copy_layouts
        # remove the default layout first
        remove_file "app/views/layouts/application.html.erb"
        # TODO remove the haml hardcode, let them choose what template they want
        directory "views/layouts/haml", "app/views/layouts"
      end

      def copy_global_views
        directory "views/home", "app/views/home"
      end

      def copy_assets
        remove_file "app/assets/stylesheets/application.css"
        directory "assets","app/assets"
      end
      
      def copy_templates
        directory 'rails/', 'lib/templates/'
      end

      def setup_configs
        environment "config.i18n.default_locale = :zh"
        [:development,:test,:production].each {|env| environment "config.login_url = '/login' # TODO change this yourself", :env => env}
      end

    end
  end
end
