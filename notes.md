<!-- place\ the following code in the individual list show page-->
<h3> <%= @list.name.titlecase %> </h3>
<h4>Add and item to your to-do list!</h4>
<%= form_for @list do |f| %>
  <%= fields_for :items do |f| %>
    <%= f.label "Item Name" %>
    <%= f.text_field :name %>
    <%= f.radio_button :complete, true %> Complete? <br />
  <% end %>
  <%= f.submit %>
<% end %>
