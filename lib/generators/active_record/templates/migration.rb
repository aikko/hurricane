class HurricaneCreate<%= plural_table_name.humanize %> < ActiveRecord::Migration
  def change
    create_table :<%= table_name %> do |t|
<%= model_data%>

<% attributes.each do |attr| -%>
      t.<%=attr.type%> :<%=attr.name%>
<% end -%>
      t.timestamps
    end
    
    create_table :roles do |t|
      t.string :name
      t.string :key
      t.text :desc
      t.timestamps
    end

    add_index :roles, :key, :unique => true
<%= create_indexes %>
  end
end
