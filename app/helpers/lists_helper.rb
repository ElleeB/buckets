module ListsHelper

  def incomplete_items?
    @list.items.any? {|item| item.complete == false}
  end

  def display_incomplete_items(list)
    display = []
    incompletes = list.items.reject {|item| item.complete == true}
    incompletes.each do |item|
      display << "<h4><p> #{check_box_tag 'complete[item_ids][]', item.id}  #{item.name.titlecase} </p></h4>"
    end
    display
  end
end
