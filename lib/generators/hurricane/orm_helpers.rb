module Hurricane
  module Generators
    module OrmHelpers
      def model_contents
        <<-CONTENT
  # add join table
  has_and_belongs_to_many :roles, :join_table => '#{table_name}_roles'
CONTENT
      end
      def model_exists?(model)
        File.exists?(File.join(destination_root, model_path(model)))
      end
                                                
      def migration_exists?(table_name)
        Dir.glob("#{File.join(destination_root, migration_path)}/[0-9]*_*.rb").grep(/\d+_add_devise_to_#{table_name}.rb$/).first
      end 
                                                                          
      def migration_path
        @migration_path ||= File.join("db", "migrate")
      end

      def model_path(model)
        File.join("app", "models","#{model}.rb")
      end
    end
  end
end
