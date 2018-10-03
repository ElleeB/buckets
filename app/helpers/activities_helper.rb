module ActivitiesHelper

  def past_due(activity)
    if activity.countdown < 0
      tag.p "This activity is past due!"
    else
      tag.p "#{activity.countdown} days until this drop is due!"
    end
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
end
