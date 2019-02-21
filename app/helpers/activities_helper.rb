module ActivitiesHelper

  def past_due(activity)
    if activity.countdown < 0
      tag.p "This activity is past due!"
    else
      tag.p "#{activity.countdown} days until this drop is due!"
    end
  end

  def display_activity_lists(activity)
    display = []
    tag.hr
    tag.h2 "To-Do Lists"
    activity.lists.each do |list|
      display << "<h4><p>#{link_to list.name.titlecase, list_path(list)}</h4></p>"
    end
    display
  end

  def list_categories(activity)
    categories = []
    activity.categories.each do |category|
      categories << "<p> #{category.name} </p>"
    end
    categories
  end

  def accomplished_activities(activities)
    accomplished = activities.reject { |activity| !activity.complete }
    !accomplished.empty?
  end

  def pending_activities(activities)
    pending = activities.reject { |activity| activity.complete }
    !pending.empty?
  end

  def any_activities?(activities)
    activities.empty?
  end

  def current_user_categories
    @current_user.categories
  end
end
