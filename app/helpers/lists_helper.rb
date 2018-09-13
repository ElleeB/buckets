module ListsHelper

  # def display_incomplete_items
  #   @list.items.any? {|item| item.complete == false}
  # end
  def incomplete_items?
    @list.items.any? {|item| item.complete == false}
  end
end
