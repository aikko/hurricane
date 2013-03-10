module Hurricane
  module Generators
    class HurricaneGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers

      namespace "hurricane"
      source_root File.expand_path("../templates",__FILE__)

      desc "generate a model with the given NAME with hurricane"

      hook_for :orm
      
      def generate_controllers
        source,target,suffix = "controllers/","app/controllers","_controller.rb"
        ["home","login","roles","login_required"].each {|name| copy_file source+name+suffix, target+name+suffix}
        template "controllers/users_controller.rb","app/controllers/#{plural_name}_controller.rb"
      end

      def copy_views
        directory "views/login", "app/views/login"
        directory "views/roles", "app/views/roles"
        Dir.glob(File.join(find_in_source_paths("views/users/"),"*.haml")).each do  |filename| 
          template filename, "views/#{plural_name}/#{filename.split('/').last}"
        end
        template "views/shared/_menu.html.haml","app/views/shared/_menu.html.haml"
      end

      def routing
        route <<ROUTES
resources :roles do
    get 'page/:page', :action => :index, :on => :collection
    delete 'delete/all', :action => :destroy_all, :on => :collection
  end
  resources :users do
    resources :roles
    get 'page/:page', :action => :index, :on => :collection
    delete 'delete/all', :action => :destroy_all, :on => :collection
  end

  root :to => "home#index"

  get 'login' => 'login#index'
  post 'login' => 'login#new'
  get 'logout' => 'login#logout'
ROUTES
      end

      def remove_public_index
        remove_file "public/index.html"
      end

      def copy_ability
        template "cancan/ability.rb","app/model/ability.rb"
      end
    end
  end
end
