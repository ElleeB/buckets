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



# <% @list.items.each do |item| %>
#   <% if item.complete == false %>
#     <h4><p><%= check_box_tag 'complete[item_ids][]', item.id %> <%= item.name.titlecase %> </p></h4>
#   <% end %>
# <% end %>
# <%= f.submit %>
# <% end %>
# <hr>

# def incomplete_items?
#   @list.items.any? {|item| item.complete == false}
# end
# end
#
#
# def display_incomplete_items(list)
# form_for list do |f|
#   list.items.each do |item|
#     if item.complete == false
#       yield
#       # raw("<h4><p>" "#{check_box_tag 'complete[item_ids][]' item.id} #{item.name.titlecase}" "</p></h4>")
#     end
#   end
# end
# end


<%= form_for @activity, :url => activity_path do |f| %>
  <% f.submit "Mark Complete" %>
<% end %>


<% !activity.complete %>
<h3>Pending</h3>
<% @activites.each do |activity| %>
  <h2><%= link_to "#{activity.title}", activity_path(activity.id) %></h2>
<% end %>
<% end %>
