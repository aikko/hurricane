# coding: utf-8
require 'rails/generators/active_record'
require 'generators/hurricane/orm_helpers'

module ActiveRecord
  module Generators
    class HurricaneGenerator < ActiveRecord::Generators::Base
      argument :attributes, :type => :array, :default => [],  :banner => "field:type field:type"
      attr_accessor :attributes

      include Hurricane::Generators::OrmHelpers
      source_root File.expand_path("../templates",__FILE__)

      def copy_migration
         # copy from devise
         migration_template "migration.rb", "db/migrate/hurricane_create_#{table_name}"
      end

      def generate_model
        invoke "active_record:model",[name],:migration => false unless model_exists?(singular_name) && behavior == :invoke
        template 'role_model.rb','app/models/role.rb'
      end


      def inject_content
        content = ''
        # accept user defined attributes
        if attributes.any?
          content += '  attr_accessible'
          attributes.each_with_index do |attr,i| 
              content += " :#{attr.name}"
              content += ',' if i < attributes.size - 1
          end
        end
        content +=  model_contents + <<-CONTENT

  # this fields are essential to autherization
  attr_accessible :email, :mobile 

        CONTENT
        inject_into_class(model_path(singular_name),get_class_path.last, add_indent(content)) if model_exists?(singular_name) 
      end

      def model_data
        <<-RUBY
      # Database authenticatable
      t.string :email, :null => false, :default => ""
      t.string :mobile, :null => true, :default => ""
        RUBY
      end

      def create_indexes
        <<-SCRIPTS
    #create the join table
    create_table :#{table_name}_roles do |t|
      t.integer :#{singular_name}_id
      t.integer :role_id
    end

    #create indexes
    add_index :#{table_name}, :email, :unique => true
    add_index :#{table_name}, :mobile
    add_index :#{table_name}_roles, [:#{singular_name}_id, :role_id], :unique => true
        SCRIPTS
      end

      def generate_seeds
        remove_file "db/seeds.rb"
        template "seeds.rb","db/seeds.rb"
      end

      def model_attributes
        attributes.inject("") {|sum,attr| sum << ",#{attr.name}:''"}
      end

      private
      def get_class_path
        if namespaced?
          class_name.to_s.split("::")
        else
          [class_name]
        end
      end

      def add_indent(content)
        indent = get_class_path.size - 1
        content.split("\n").map { |line| "  " * indent + line} .join("\n")
      end
    end
  end
end
