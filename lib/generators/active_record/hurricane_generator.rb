require 'rails/generators/active_record'
require 'generators/hurricane/orm_helpers'

module ActiveRecord
  module Generator
    class HurricaneGenerator < ActiveRecord::Generators::Base
      argument :attributes, :type => :array, :default => [],  :banner => "field:type field:type"

      include Hurricane:Generators::OrmHelpers
      source_root File.expand_path("../templates",__FILE__)

      def copy_migration
        # copy from devise
        migration_template "migration.rb", "db/migrate/devise_create_#{table_name}"
      end

      def generate_model
        invoke "active_record:model", [name], :migration => false unless model_exists? && behavior == :invoke
        generate "model", "Role name:string key:string desc:text"
      end


      def inject_content
        content = model_contents + <<CONTENT
  # this fields are essential to autherization
  attr_accessor :email, :mobile 
CONTENT
        inject_into_class(model_path,class_path, add_indent(content) if model_exists? 
        inject_into_class(model_path,"Role","  has_and_belongs_to_many :users, :join_table => '#{table_name}_roles'") if model_exists?
      end

      def model_data
<<RUBY
      # Database authenticatable
      t.string :email, :null => false, :default => ""
      t.string :mobile, :null => true, :default => ""
RUBY
      end

      def create_indexes
<<RUBY
    # index
    add_index :#{table_name}, :email
    add_index :#{table_name}, :mobile
    add_index :roles, :key

    #create the join table
    create_tale(:#{table_name}_roles) do |t|
      t.integer :#{singular_name}_id
      t.integer :role_id
    end

    add_index :#{table_name}_roles, :#{singular_name}_id, :role_id
RUBY

      private
      def class_path
        if namespaced?
          class_name.to_s.split("::").last
        else
          class_name
      end

      def add_indent(content)
        indent = class_path.size - 1
        content.split("\n").map { |line| "  " * indent} .join("\n")
      end
    end
  end
end
