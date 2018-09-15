module ListsHelper

  # def display_incomplete_items
  #   @list.items.any? {|item| item.complete == false}
  # end
  # def incomplete_items?
  #   @list.items.any? {|item| item.complete == false}
  # end


  def display_incomplete_items(list)
    display = []
    incomplete = list.items.reject {|item| item.complete == true}
    incomplete.collect do |item|
      display << raw("<h4><p> check_box_tag 'complete[item_ids][]' '#{item.id}' '#{item.name.titlecase}' </p></h4>")
    end
    display
    # => [#<Item id: 5, name: "item 1", list_id: 2, user_id: 2, activity_id: 2, complete: false>,
    #<Item id: 6, name: "item 2", list_id: 2, user_id: 2, activity_id: 2, complete: false>,
    #<Item id: 7, name: "item 3", list_id: 2, user_id: 2, activity_id: 2, complete: false>]
  end
end
