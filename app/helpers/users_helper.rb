module UsersHelper

  def display_incomplete_activities(activities)
    incompletes = activities.reject { |activity| activity.complete == true }
    incompletes.each do |activity|
      display << "<h4><li> #{link_to} #{activity.title}, activity_path(activity.id) </h4>"
    end
    display
  end
end
