module BucketItemsHelper

  def incomplete_activities?
    @activity.lists.any? {|list| list.complete == false}
  end
end
