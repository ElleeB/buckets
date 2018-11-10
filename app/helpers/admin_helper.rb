module AdminHelper
  def category_list
    Category.all.each do |category|
      category.name
    end
  end
end


# <% @categories.each do |category| %>
#   <%= category.name %>
# <% end %>
