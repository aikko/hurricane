class Role < ActiveRecord::Base
  attr_accessible :name,:key,:desc
  has_and_belongs_to_many :<%= plural_name%>, :join_table => '<%=plural_table_name%>_roles'
end 
