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
        # TODO remove the haml hardcode, let them choose what template they want
        directory "views/layout/haml", "app/views/layout"
      end

      def copy_assets
        directory "assets","app/assets"
      end
      
      def copy_i18n_files
        copy_file "i18n/en.yml", "config/locales/hurricane.en.yml"
        copy_file "i18n/zh.yml", "config/locales/hurricane.zh.yml"
      end

      def copy_templates
        directory 'rails/', 'lib/templates/'
      end

      def setup_configs
        environment "config.i18n.default_locale = :zh"
        [:development,:test,:production].each {|env| environment "config.login_uri = '/login' # TODO change this yourself", :env => env}
      end
    end
  end
end
