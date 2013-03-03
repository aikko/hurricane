class HurricaneCreate<%= table_name.camelize %> < ActiveRecord::Migration
  def change
    create_table(:<%= table_name %>) do |t|
<%= model_data -%>

<% attributes.each do |attr| -%>
      t.<%=attr.type%> :<%=attr.name%>
<% end -%>
      t.timestamps
    end

    <%= create_index %>
  end
end
