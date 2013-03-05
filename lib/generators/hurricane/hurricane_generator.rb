module Hurricane
  module Generators
    class HurricaneGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers

      namespace "hurricane"
      source_root File.expand_path("../templates",__FILE__)

      desc "generate a model with the given NAME with hurricane"

      hook_for :orm
      
      def generate_controllers
        copy_file "controllers/home_controller.rb", "app/controllers"
        copy_file "controllers/login_controller.rb","app/controllers"
        copy_file "controllers/roles_controller.rb","app/controllers"
        template "controllers/users_controller.rb","app/controllers/#{plural_name}_controller.rb"
      end

      def copy_views
        directory "views/login", "app/views/login"
        direcotry "views/roles", "app/views/roles"
        Dir.foreach("views/users") {|filename| template "views/users/#{filename}", "views/#{plural_name}/#{filename}"}
        template "views/shared/_menu.html.haml","app/views/shared/"
      end

      def routing
        template "configs/routes.rb","configs/"
      end

      def copy_ability
        template "cancan/ability.rb","app/model/ability.rb"
      end
    end
  end
end
