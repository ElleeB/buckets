module ListsHelper

  def display_incomplete_items(list)
    if list.items.any? do |item|
        incomplete = []
        if item.complete == false
          incomplete << item
        form_for list do |f|
          incomplete.each do |item|

            @checkbox = "<h4><p> check_box_tag 'complete[item_ids][]', '#{item.id}' '#{item.name.titlecase}'</p></h4>".html_safe

          end

        end

      end
    end
  end
end
end
